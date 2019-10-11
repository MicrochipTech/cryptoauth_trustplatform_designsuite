#include "cryptoauthlib.h"
#include "atcacert/atcacert_pem.h"
#include "common.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#if defined(__XC32__)
#include "definitions.h"
#endif
#if defined(ATMEL_START)
#include <atmel_start.h>
#endif
#include "../../../TFLXTLS_resource_generation/secureboot_test_app.h"
#include "../../../TFLXTLS_resource_generation/secureboot_test_app_sign.h"
#include "../../../TFLXTLS_resource_generation/slot_6_secret_key.h"

#if defined(__XC32__)
#define TOGGLE_STATUS_LED GPIO_PA02_Toggle()
#endif
#if defined(ATMEL_START)
#define TOGGLE_STATUS_LED 	gpio_toggle_pin_level(GPIO(GPIO_PORTA, 2));
#endif

#define BOOT_START 0x00000000
#define APP_START 0x0000C000
#define SIGNATURE_ADDRESS 0x0003FC00
#define APP_LEN_ADDRESS 0x0003FD00
unsigned int volatile * const app_length = (unsigned int *) APP_LEN_ADDRESS;

int RNG(uint8_t *dest, unsigned size);

/** \brief This api calculates application images digest and reads signature based on the
 *          resource files generated for TrustFex
 */
ATCA_STATUS get_application_digest_signature(uint8_t* app_digest, uint8_t* app_signature)
{
    ATCA_STATUS status;
    atcac_sha2_256_ctx sha_context;
	
    do
    {
        //Initialize SHA engine
        if(ATCA_SUCCESS != (status = atcac_sw_sha2_256_init(&sha_context)))
            break;

        //Read application bytes to feed SHA engine
        if(ATCA_SUCCESS != (status = atcac_sw_sha2_256_update(&sha_context, BOOT_START, (APP_START + *app_length))))
           break;

        //Get Digest from SHA engine
        if(ATCA_SUCCESS != (status = atcac_sw_sha2_256_finish(&sha_context, app_digest)))
           break;

        memcpy(app_signature, SIGNATURE_ADDRESS, 64);
    }while(0);

    return status;
}
/** \brief This api performs Firmware validate operation on application image and signature
 *          files generated during resource generation for TrustFLEX *
 */
ATCA_STATUS firmware_validate(ATCAIfaceCfg *cfg)
{
   ATCA_STATUS status;
   char displaystr[400];
   size_t displaylen;
   uint8_t app_digest[ATCA_SHA_DIGEST_SIZE];
   uint8_t app_signature[ATCA_SIG_SIZE];
   uint8_t host_random[32];
   bool is_verified;

   do
   {
      // Initialize the stack
      if ((status = atcab_init(cfg)) != ATCA_SUCCESS)
      {
         printf("atcab_init() failed with ret=0x%08X\r\n", status);
         break;
      }

      //Get Applications digest and Signature
      if(ATCA_SUCCESS != (status = get_application_digest_signature(app_digest, app_signature)))
      {
         printf("get_application_digest_signature() failed with ret=0x%08X\r\n", status);
         break;
      }
      displaylen = sizeof(displaystr);
      atcab_bin2hex(app_digest, ATCA_SHA_DIGEST_SIZE, displaystr, &displaylen);
      printf("\nApplication Digest:\r\n%s\r\n", displaystr);
      displaylen = sizeof(displaystr);
      atcab_bin2hex(app_signature, ATCA_SIG_SIZE, displaystr, &displaylen);
      printf("\nApplication Signature:\r\n%s\r\n", displaystr);

      //In real applications, IO Protection pairing step should be done on the first
      // power-up and lock IO protection key to avoid further updates to it.

      //Get host random, to be used in bus obfuscation
      RNG(host_random, sizeof(host_random));


      //Perform the Secureboot operation with device
      if(ATCA_SUCCESS != (status = atcab_secureboot_mac(SECUREBOOT_MODE_FULL_STORE, app_digest, app_signature, host_random, slot_6_secret_key, &is_verified)))
         break;

      if(is_verified)
      {
         printf("Firmware validation is successful.\r\n");
      }
      else
      {
		  if(ATCA_SUCCESS != (status = atcab_secureboot_mac(SECUREBOOT_MODE_FULL_COPY, app_digest, app_signature, host_random, slot_6_secret_key, &is_verified)))
		  break;
		  if(is_verified)
		  {
			  printf("Firmware validation is successful.\r\n");
		  }
		  else
		  {		  
              printf("Firmware validation has failed!\r\n");
		      status = !ATCA_SUCCESS;
		  }
      }

   } while (0);

   (void)atcab_release();

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
   {
		status = firmware_validate(cfg);
		printf("\r\nExecution completed with status %02X\r\n", status);
   }
 	
   if (status == ATCA_SUCCESS)
   {
	    printf("\r\nApplication firmware validated successfully, jumping to the application image.\r\n");
		uint32_t app_start_address = *(uint32_t *)(APP_START + 4);
		/* Rebase the Stack Pointer */
		__set_MSP(*(uint32_t *) APP_START);

		/* Rebase the vector table base address */
		SCB->VTOR = ((uint32_t) APP_START & SCB_VTOR_TBLOFF_Msk);

		/* Jump to application Reset Handler in the application */
		asm("bx %0"::"r"(app_start_address));
   }
   
    while(1)
    {
	    TOGGLE_STATUS_LED;
	    atca_delay_ms(50);
    }
}


