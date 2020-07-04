/** \file
 * \brief Public Key Rotation
 *
 * \copyright (c) 2015-2018 Microchip Technology Inc. and its subsidiaries.
 *
 * \page License
 *
 * Subject to your compliance with these terms, you may use Microchip software
 * and any derivatives exclusively with Microchip products. It is your
 * responsibility to comply with third party license terms applicable to your
 * use of third party software (including open source software) that may
 * accompany Microchip software.
 *
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
 * PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT,
 * SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE
 * OF ANY KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF
 * MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE
 * FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL
 * LIABILITY ON ALL CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED
 * THE AMOUNT OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR
 * THIS SOFTWARE.
 */

#include "cryptoauthlib.h"
#include "atcacert/atcacert_pem.h"
#include "host/atca_host.h"
#include "../../../assets/dependencies/common/common.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../00_resource_generation/public_key_rotation.h"
#if defined(__XC32__)
#include "definitions.h"
#endif

#if defined(ATMEL_START)
#include <atmel_start.h>
#endif

#if defined(__XC32__)
#define TOGGLE_STATUS_LED GPIO_PA02_Toggle()
#endif
#if defined(ATMEL_START)
#define TOGGLE_STATUS_LED 	gpio_toggle_pin_level(GPIO(GPIO_PORTA, 2));
#endif

#if defined(__XC32__)
extern ATCAIfaceCfg atecc608a_0_init_data;
#endif

uint16_t rotating_key_slot = 14;
uint16_t authority_key_slot = 13;

ATCA_STATUS publickey_validate(bool validate)
{
    ATCA_STATUS status;
    uint8_t sn[9];
    uint8_t public_key[64];
    bool is_verified = false;
    uint8_t rand_out[ATCA_KEY_SIZE];
    atca_temp_key_t temp_key;
    atca_nonce_in_out_t nonce_params;
    uint8_t gen_key_other_data[3];
    atca_gen_key_in_out_t gen_key_params;
    uint8_t verify_other_data[19];
    uint8_t validation_msg[55];
    uint8_t validation_digest[32];
    atca_sign_internal_in_out_t sign_params;
    uint8_t nonce[32],config[128];

    do
    {
        // Read serial number from device
        if ((status = atcab_read_serial_number(sn)) != ATCA_SUCCESS)
            break;

        // Read configuration zone data from device
        if ((status = atcab_read_config_zone(config)) != ATCA_SUCCESS)
            break;

		if (validate)
            memcpy(nonce, validated_nonce, 32);
        else
            memcpy(nonce, invalidated_nonce, 32);

        //Generate Nonce on host and device
        memset(&temp_key, 0, sizeof(temp_key));
        memset(&nonce_params, 0, sizeof(nonce_params));
        nonce_params.mode = NONCE_MODE_PASSTHROUGH;
        nonce_params.zero = 0;
        nonce_params.num_in = nonce;
        nonce_params.rand_out = rand_out;
        nonce_params.temp_key = &temp_key;
        if ((status = atcab_nonce(nonce_params.num_in)) != ATCA_SUCCESS)
            break;

        if ((status = atcah_nonce(&nonce_params)) != ATCA_SUCCESS)
            break;

        //This configuration allows reading public key, if not, host should
        // maintain the track of public key in the slot
        //Read the public key from the rotating public key slot
        if ((status = atcab_read_pubkey(rotating_key_slot, public_key)) != ATCA_SUCCESS)
            break;

        memset(gen_key_other_data, 0, sizeof(gen_key_other_data));
        gen_key_params.mode = GENKEY_MODE_PUBKEY_DIGEST;
        gen_key_params.key_id = rotating_key_slot;
        gen_key_params.public_key = public_key;
        gen_key_params.public_key_size = sizeof(public_key);
        gen_key_params.other_data = gen_key_other_data;
        gen_key_params.sn = sn;
        gen_key_params.temp_key = &temp_key;
        if ((status = atcah_gen_key_msg(&gen_key_params)) != ATCA_SUCCESS)
            break;

        memset(&sign_params, 0, sizeof(sign_params));
        sign_params.sn = sn;
        sign_params.verify_other_data = verify_other_data;
        sign_params.key_id = authority_key_slot;
        sign_params.slot_config = (config[20 + rotating_key_slot * 2]   | config[21 + rotating_key_slot * 2] << 8);
        sign_params.key_config = (config[96 + rotating_key_slot * 2] | config[97 + rotating_key_slot * 2] << 8);
        sign_params.for_invalidate = !validate;
        sign_params.message = validation_msg;
        sign_params.digest = validation_digest;
        sign_params.temp_key = &temp_key;
        if ((status = atcah_sign_internal_msg(ATECC608A, &sign_params)) != ATCA_SUCCESS)
            break;

        // Calculate the rotating public key digest and store in tempkey
        if ((status = atcab_genkey_base(gen_key_params.mode, gen_key_params.key_id, gen_key_params.other_data, NULL)) != ATCA_SUCCESS)
            break;

        // Validate/Invalidate the rotating public key slot
        if (validate)
        {
            // Validate the rotating public key slot
            if ((status = atcab_verify_validate(rotating_key_slot, validated_signature, verify_other_data, &is_verified)) != ATCA_SUCCESS)
                break;
        }
        else
        {
            if ((status = atcab_verify_invalidate(rotating_key_slot, invalidated_signature, verify_other_data, &is_verified)) != ATCA_SUCCESS)
                break;
        }

        if (is_verified == true)
            status = ATCA_SUCCESS;
        else
            status = !ATCA_SUCCESS;

    } while (0);

    return status;

}


/** \brief This api performs public key rotation
 **
 */
static ATCA_STATUS public_key_rotation(ATCAIfaceCfg *cfg)
{
    ATCA_STATUS status;
    uint8_t valid_buf[4];
    bool is_verified = false;
    char displaystr[400];
    size_t displaylen;

    do
    {
        // Initialize the stack
        if ((status = atcab_init(cfg)) != ATCA_SUCCESS)
        {
            printf("atcab_init() failed with ret=0x%08X\r\n", status);
            break;
        }

        //This configuration allows reading public key, if not, host should
        // maintain the track of public key in the slot
        //Read rotating public key slot to check whether it contains a
        // validated public key in slot
        if ((status = atcab_read_zone(ATCA_ZONE_DATA, rotating_key_slot, 0, 0, valid_buf, 4)) != ATCA_SUCCESS)
            break;

        //If the validated public key is already in slot, invalidate the slot to update the new public key
        if (valid_buf[0] >> 4 == 0x05)
        {
            if ((status = publickey_validate(false)) != ATCA_SUCCESS)
                break;
            printf("\nValidated public key is already in slot, invalidated the slot to update the new public key\r\n");

        }

        //Write the New rotating public key to slot
        if ((status = atcab_write_pubkey(rotating_key_slot, public_key)) != ATCA_SUCCESS)
            break;

        displaylen = sizeof(displaystr);
        atcab_bin2hex(public_key, ATCA_PUB_KEY_SIZE, displaystr, &displaylen);
        printf("\nNew Rotating Public key written to device:\r\n\r\n%s\r\n", displaystr);

        // Validate the new public key in slot, so that it can be used for cryptographic operations
        if ((status = publickey_validate(true)) != ATCA_SUCCESS)
            break;

        printf("\nValidated the Rotating Public key in device\r\n");
        //Once it is validated, it can verify with the digest,signature generated
        // with rotating private key with rotating public key in slot
        if ((status = atcab_verify_stored(rotating_digest, rotating_signature, rotating_key_slot, &is_verified)) != ATCA_SUCCESS)
            break;

        if (is_verified == true)
        {
            status = ATCA_SUCCESS;
            printf("\nVerified the Rotating Public key in device is usable for verify operations \r\n");
        }
        else{
            status = !ATCA_SUCCESS;
            printf("\nRotating Public key verification failed\r\n");

        }

    } while (0);

    return status;
}

/** \brief This is the main function that triggers various examples.
 *
 */
#if defined(_WIN32) || defined(__linux__) || defined(__APPLE__)
int main(int argc, char* argv[])
#else
int main(void)
#endif
{
    ATCAIfaceCfg *cfg;
    ATCA_STATUS status;
    uint16_t delay_ms;
	cfg = &cfg_tflxtls;

   //Select Interface configuration and device
#if defined(_WIN32) || defined(__linux__) || defined(__APPLE__)
   cfg = get_device_details(argc, &argv[1]);
   cfg->devtype = ATECC608A;
#else
#if defined(__XC32__)
   cfg = &atecc608a_0_init_data;
   /* Initialize all modules */
   SYS_Initialize ( NULL );
#endif
#if defined(ATMEL_START)
/* Initialize all modules */
atmel_start_init();
gpio_set_pin_direction(GPIO(GPIO_PORTA, 2),GPIO_DIRECTION_OUT);
cfg->atcai2c.bus=2;
#endif
#endif

    //Checking if the connected device matches with selected device
    if (ATCA_SUCCESS != (status = check_device_type_in_cfg(cfg, false)))
        printf("check_device_type_in_cfg() failed with ret=0x%08X\r\n", status);
    else
        status = public_key_rotation(cfg);

    printf("\r\nExecution completed with status %02X\r\n", status);
    delay_ms = status == ATCA_SUCCESS ? 500 : 50;

    while(1)
    {
        TOGGLE_STATUS_LED;
        atca_delay_ms(delay_ms);
    }
}