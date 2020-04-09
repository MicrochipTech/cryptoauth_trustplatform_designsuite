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
#include "atcacert/atcacert.h"
#include "atcacert/atcacert_def.h"
#include "atcacert/atcacert_pem.h"
#include "atcacert/atcacert_host_hw.h"
#include "atcacert/atcacert_client.h"
#include "host/atca_host.h"
#include "basic/atca_helpers.h"
#include "common.h"
#include "cust_def_1_signer.h"
#include "cust_def_2_device.h"


/** \brief global storage for signer certificate */
uint8_t g_signer_cert[1024];
size_t  g_signer_cert_size = sizeof(g_signer_cert);

/** \brief global storage for device certificate */
uint8_t g_device_cert[1024];
size_t  g_device_cert_size = sizeof(g_device_cert);

/** \brief global storage for the challenge data to sign by the device */
uint8_t g_challenge[32];
uint8_t g_response[64];

char displaystr[1024];
size_t displaylen;

extern const uint8_t g_cert_ca_public_key_1_signer[64];

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

/** \brief This client role method demonstrates how to read cert data stored in the
 * secure element and reconstruct a full X.509 cert in DER format.  Because this is an
 * example, it prints the reconstructed cert data to the console in ASCII hex format.
 */
int client_rebuild_certs(void)
{
    int ret;
    uint8_t signer_public_key[64];

    do
    {
        g_signer_cert_size = sizeof(g_signer_cert);
        if(ATCACERT_E_SUCCESS != (ret = atcacert_read_cert(&g_cert_def_1_signer, g_cert_ca_public_key_1_signer, g_signer_cert, &g_signer_cert_size)))
        {
            printf("atcacert_read_cert failed with an error %d\r\n", ret);
            break;
        }
        displaylen = sizeof(displaystr);
        atcacert_encode_pem_cert(g_signer_cert, g_signer_cert_size, displaystr, &displaylen);
        printf("\nCLIENT: Rebuilt Signer Certificate: \r\n%s\r\n", displaystr);

        if(ATCACERT_E_SUCCESS != (ret = atcacert_get_subj_public_key(&g_cert_def_1_signer, g_signer_cert, g_signer_cert_size, signer_public_key)))
        {
            printf("atcacert_get_subj_public_key failed with an error %d\r\n", ret);
            break;
        }

        g_device_cert_size = sizeof(g_device_cert);
        if(ATCACERT_E_SUCCESS != (ret = atcacert_read_cert(&g_cert_def_2_device, signer_public_key, g_device_cert, &g_device_cert_size)))
        {
            printf("atcacert_read_cert failed with an error %d\r\n", ret);
            break;
        }
        displaylen = sizeof(displaystr);
        atcacert_encode_pem_cert(g_device_cert, g_device_cert_size, displaystr, &displaylen);
        printf("CLIENT: Rebuilt Device Certificate: \r\n%s\r\n", displaystr);

    }while(0);

    return ret;
}

/** \brief This host role method demonstrates how to do a chain verify.  In this example,
 * there is a root certificate authority which signed the signer's cert.  The signer signed
 * the device cert.  The chain verification performs an ECDSA verification of each link in
 * the cert chain.  This verifies that the device has been properly signed into the chain
 *  starting from the CA root of trust (RoT).
 */
int host_verify_cert_chain(void)
{
    int ret;
    uint8_t signer_public_key[64];

    do
    {
        // Validate signer cert against its certificate authority (CA) public key
        if(ATCACERT_E_SUCCESS != (ret = atcacert_verify_cert_hw(&g_cert_def_1_signer,  g_signer_cert, g_signer_cert_size, g_cert_ca_public_key_1_signer)))
        {
            printf("atcacert_verify_cert_hw failed with an error %d\r\n", ret);
            break;
        }
        printf("HOST: Signer certificate verified against root public key!\r\n");

        // Get the signer's public key from its certificate
        if(ATCACERT_E_SUCCESS != (ret = atcacert_get_subj_public_key(&g_cert_def_1_signer, g_signer_cert, g_signer_cert_size, signer_public_key)))
        {
            printf("atcacert_get_subj_public_key failed with an error %d\r\n", ret);
            break;
        }

        // Validate the device cert against its certificate authority (CA) which is the signer
        if(ATCACERT_E_SUCCESS != (ret = atcacert_verify_cert_hw(&g_cert_def_2_device, g_device_cert, g_device_cert_size, signer_public_key)))
        {
            printf("atcacert_verify_cert_hw failed with an error %d\r\n", ret);
            break;
        }
        printf("HOST: Device certificate verified against signer public key!\r\n");
    } while (0);

    return ret;
}

/** \brief This host role method generates a challenge to be signed by the CryptoAuth
 * device.  This challenge is basically a random number that once signed can be verified
 *  by the host.
 */
int host_generate_challenge(void)
{
    int ret;

    do
    {
        if(ATCACERT_E_SUCCESS != (ret = atcacert_gen_challenge_hw(g_challenge)))
        {
            printf("atcacert_gen_challenge_hw failed with an error %d\r\n", ret);
            break;
        }
        displaylen = sizeof(displaystr);
        atcab_bin2hex(g_challenge, sizeof(g_challenge), displaystr, &displaylen);
        printf("\nHOST: Generated challenge:\r\n%s\r\n\r\n", displaystr);
    } while (0);

    return ret;
}

/** \brief This client role method signs the challenge and returns the signature to the host.  For
 * example purposes, the signature is contained in a global variable g_response.
 */
int client_generate_response(void)
{
    int ret;

    do
    {
        if(ATCACERT_E_SUCCESS != (ret = atcacert_get_response(g_cert_def_2_device.private_key_slot, g_challenge, g_response)))
        {
            printf("atcacert_get_response failed with an error %d\r\n", ret);
            break;
        }
        displaylen = sizeof(displaystr);
        atcab_bin2hex(g_response, sizeof(g_response), displaystr, &displaylen);
        printf("CLIENT: Calculated response to host challenge:\r\n%s\r\n\r\n", displaystr);
    } while (0);

    return ret;
}

/** \brief This host role method verifies the signature of the challenge. This step insures that
 * the device can prove it owns the private key associated with the public key of its certificate.
 * Since the certificate is verified to be in a root of trust certificate chain, this ECDSA
 * verification step makes sure the public key the device says it has is truly owned by the device
 * and not a forgery.
 */
int host_verify_response(void)
{
    int ret;
    uint8_t device_public_key[64];

    do
    {
        if(ATCACERT_E_SUCCESS != (ret = atcacert_get_subj_public_key(&g_cert_def_2_device, g_device_cert, g_device_cert_size, device_public_key)))
        {
            printf("atcacert_get_subj_public_key failed with an error %d\r\n", ret);
            break;
        }
        displaylen = sizeof(displaystr);
        atcab_bin2hex(device_public_key, sizeof(device_public_key), displaystr, &displaylen);
        printf("HOST: Device public key from certificate:\r\n%s\r\n\r\n", displaystr);

        if(ATCACERT_E_SUCCESS != (ret = atcacert_verify_response_hw(device_public_key, g_challenge, g_response)))
        {
            printf("atcacert_verify_response_hw failed with an error %d\r\n", ret);
            break;
        }
        printf("HOST: Device response to challenge verified!\r\n");
    }while(0);

    return ret;
}
/** \brief This api performs symmetric authentication using symmetric file
 *          generated during resource generation for TrustFLEX *
 */
static ATCA_STATUS asymmetric_authentication(ATCAIfaceCfg *cfg)
{
    ATCA_STATUS status;

    do
    {
		if(ATCA_SUCCESS != (status = atcab_init(cfg)))
			break;
		if((status = client_rebuild_certs()) != ATCA_SUCCESS)
			break;
		if((status = host_verify_cert_chain()) != ATCA_SUCCESS)
			break;
		if((status = host_generate_challenge()) != ATCA_SUCCESS)
			break;
		if((status = client_generate_response()) != ATCA_SUCCESS)
			break;
		if((status = host_verify_response()) != ATCA_SUCCESS)
			break;
    }
    while (0);

    if(status == ATCA_SUCCESS)
        printf("\nAccessory device authenticated successfully\r\n");
    else
        printf("\nAccessory device not authenticated\r\n");

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
        status = asymmetric_authentication(cfg);

    printf("\r\nExecution completed with status %02X\r\n", status);
    delay_ms = status == ATCA_SUCCESS ? 500 : 50;

    while(1)
    {
		TOGGLE_STATUS_LED;
        atca_delay_ms(delay_ms);
    }
}