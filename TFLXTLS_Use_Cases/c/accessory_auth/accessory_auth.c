/** \file
 * \brief Accessory Authentication use case
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
#include "common.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../../TFLXTLS_resource_generation/slot_5_secret_key.h"
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

int RNG(uint8_t *dest, unsigned size);

/** \brief This api reads symmetric key from the resource files generated
 *          for TrustFex
 */
ATCA_STATUS get_symmetric_key(uint8_t *symmetric_key)
{
    memcpy(symmetric_key, slot_5_secret_key, sizeof(slot_5_secret_key));

    return ATCA_SUCCESS;
}
/** \brief This api performs symmetric authentication using symmetric file
 *          generated during resource generation for TrustFLEX *
 */
static ATCA_STATUS accessory_authenticate(ATCAIfaceCfg *cfg)
{

    ATCA_STATUS status;
    uint8_t sn[ATCA_SERIAL_NUM_SIZE];
    uint8_t symmetric_key[ATCA_KEY_SIZE];
    atca_temp_key_t temp_key;
    char displaystr[400];
    size_t displaylen; 
    uint8_t rand_out[RANDOM_NUM_SIZE], rand_number[NONCE_NUMIN_SIZE];
    atca_nonce_in_out_t nonce_params;
    atca_mac_in_out_t mac_params;
    uint8_t host_mac[MAC_SIZE];
    uint8_t device_mac[MAC_SIZE];
    uint16_t slot = 5;

    RNG(rand_number, 20);


    do
    {
        // Initialize the stack
        if ((status = atcab_init(cfg)) != ATCA_SUCCESS)
        {
            printf("atcab_init() failed with ret=0x%08X\r\n", status);
            break;
        }


        // Read serial number for host-side MAC calculations
        if ((status = atcab_read_serial_number(sn)) != ATCA_SUCCESS)
        {
            break;
        }

        // Setup nonce command
        memset(&temp_key, 0, sizeof(temp_key));
        memset(&nonce_params, 0, sizeof(nonce_params));
        nonce_params.mode = NONCE_MODE_SEED_UPDATE;
        nonce_params.zero = 0;
        nonce_params.num_in = rand_number;
        nonce_params.rand_out = rand_out;
        nonce_params.temp_key = &temp_key;

        // Create random nonce
        if ((status = atcab_nonce_rand(nonce_params.num_in, rand_out)) != ATCA_SUCCESS)
        {
            break;
        }

        // Calculate nonce in host
        if ((status = atcah_nonce(&nonce_params)) != ATCA_SUCCESS)
        {
            break;
        }


        // Setup MAC command
        memset(&mac_params, 0, sizeof(mac_params));
        mac_params.mode = MAC_MODE_BLOCK2_TEMPKEY | MAC_MODE_INCLUDE_SN; // Block 1 is a key, block 2 is TempKey
        mac_params.key_id = slot;
        mac_params.challenge = NULL;
        mac_params.key = symmetric_key;
        mac_params.otp = NULL;
        mac_params.sn = sn;
        mac_params.response = host_mac;
        mac_params.temp_key = &temp_key;

        if ((status = get_symmetric_key(symmetric_key)) != ATCA_SUCCESS)
        {
            break;
        }

        // Generate the MAC command from the device
        if ((status = atcab_mac(mac_params.mode, mac_params.key_id, mac_params.challenge, device_mac)) != ATCA_SUCCESS)
        {
            break;
        }

        displaylen = sizeof(displaystr);
        atcab_bin2hex(device_mac, MAC_SIZE, displaystr, &displaylen);
        printf("\nMAC received from device:\r\n%s\r\n", displaystr);
        
        // Calculate the MAC on the host side
        if ((status = atcah_mac(&mac_params)) != ATCA_SUCCESS)
        {
            break;
        }
        
        displaylen = sizeof(displaystr);
        atcab_bin2hex(host_mac, MAC_SIZE, displaystr, &displaylen);
        printf("\nMAC calculated on Host:\r\n%s\r\n", displaystr);

        //Check whether the MAC calculated on host is same as that generated from the device
        if (memcmp(device_mac, host_mac, 32) != 0)
        {
            status = ATCA_CHECKMAC_VERIFY_FAILED;
        }
        
        if(status == ATCA_SUCCESS)
            printf("\nAccessory device authenticated successfully\r\n");
        else
            printf("\nAccessory device not authenticated\r\n");

                    

    }
    while (0);

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
        status = accessory_authenticate(cfg);

    printf("\r\nExecution completed with status %02X\r\n", status);
    delay_ms = status == ATCA_SUCCESS ? 500 : 50;

    while(1)
    {
		TOGGLE_STATUS_LED;
        atca_delay_ms(delay_ms);
    }
}