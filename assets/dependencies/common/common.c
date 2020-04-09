#include "cryptoauthlib.h"
#include "atca_iface.h"
#include "atca_devtypes.h"

#include <stdio.h>
#if defined(_WIN32)
#include <ctype.h>
#endif

/** \brief default configuration for an ECCx08A device */
ATCAIfaceCfg cfg_tflxtls = {
    .iface_type             = ATCA_I2C_IFACE,
    .devtype                = ATECC608A,
    .atcai2c.slave_address  = 0x6C,
    .atcai2c.baud           = 400000,
    .wake_delay             = 1500,
    .rx_retries             = 20
};


/** \brief default configuration for an ECCx08A device */
ATCAIfaceCfg cfg_tngtls = {
    .iface_type             = ATCA_I2C_IFACE,
    .devtype                = ATECC608A,
    .atcai2c.slave_address  = 0x6A,
    .atcai2c.baud           = 400000,
    .wake_delay             = 1500,
    .rx_retries             = 20
};

#if defined(_WIN32)
/** \brief - Returns the Interface Config type based on the parameters passed from the command line.
 */
ATCAIfaceCfg* get_device_details(int argc, char* argv[])
{
    ATCAIfaceCfg *cfg = &cfg_ateccx08a_kithid_default;;
    char *interface, *device, *slave_address, *bus;

    do
    {
       if ((interface = argv[0]) == NULL)
          break;

       switch (tolower(*interface))
       {
       case 'h':
          if ((device = argv[1]) == NULL)
             break;
          if (tolower(*device) == 's')
          {
             cfg = &cfg_atsha204a_kithid_default;
          }
          else
          {
             cfg = &cfg_ateccx08a_kithid_default;
          }
          break;

       case 'i':
          if ((device = argv[1]) == NULL)
             break;
          if (tolower(*device) == 's')
          {
             cfg = &cfg_atsha204a_i2c_default;
          }
          else
          {
             cfg = &cfg_ateccx08a_i2c_default;
          }

          cfg->atcai2c.slave_address = 0x6A;

#if defined(__linux__)
          cfg->atcai2c.bus = 1;
#endif
          if ((slave_address = argv[2]) == NULL)
             break;
          cfg->atcai2c.slave_address = (uint8_t)strtol(slave_address, NULL, 16);

          if ((bus = argv[3]) == NULL)
             break;
          cfg->atcai2c.bus = (uint8_t)strtol(bus, NULL, 16);
          break;
       default:
          break;
       }
    } while (0);

    return cfg;
}
#endif

/** \brief - Returns the device type based on the revision_byte
 */
ATCADeviceType get_device_type_id(uint8_t revision_byte)
{
    ATCADeviceType dev_type;

    switch (revision_byte)
    {
    case 0x00:
    case 0x02:
        dev_type = ATSHA204A;
        break;

    case 0x10:
        dev_type = ATECC108A;
        break;

    case 0x50:
        dev_type = ATECC508A;
        break;

    case 0x60:
        dev_type = ATECC608A;
        break;

    default:
        dev_type = ATCA_DEV_UNKNOWN;
        break;
    }

    return dev_type;
}

/** \brief - Updates the devtype in cfg based on the info response
 */
ATCA_STATUS check_device_type_in_cfg(ATCAIfaceCfg* cfg, bool overwrite)
{
   uint8_t revision[4];
   uint8_t serial_number[9];
   ATCADeviceType device_type;
   ATCA_STATUS status = !ATCA_SUCCESS;
   char displaystr[200];
   size_t displaylen;

   do
   {
      if ((status = atcab_init(cfg)) != ATCA_SUCCESS)
      {
         printf("atcab_init() failed with ret=0x%08X\r\n", status);
         break;
      }

      // Request the Revision Number
      if ((status = atcab_info(revision)) != ATCA_SUCCESS)
      {
         printf("atcab_info() failed with ret=0x%08X\r\n", status);
         break;
      }
      displaylen = sizeof(displaystr);
      atcab_bin2hex(revision, sizeof(revision), displaystr, &displaylen);
      printf("\nDevice revision: %s\r\n", displaystr);

      // Request the Serial Number
      if ((status = atcab_read_serial_number(serial_number)) != ATCA_SUCCESS)
      {
         printf("atcab_info() failed with ret=0x%08X\r\n", status);
         break;
      }
      displaylen = sizeof(displaystr);
      atcab_bin2hex(serial_number, sizeof(serial_number), displaystr, &displaylen);
      printf("\nDevice serial number: %s\r\n\r\n", displaystr);

      //Selecting the right device based on the revision
      device_type = get_device_type_id(revision[2]);
      if (cfg->devtype != device_type)
      {
         printf("Selected device id: %d, Identified device id: %d\r\n", cfg->devtype, device_type);
         if (overwrite)
         {
            printf("Device type updated!\r\n");
            cfg->devtype = device_type;
         }
         else
         {
            printf("Selected device is not found on the bus!\r\n");
            status = ATCA_GEN_FAIL;
         }
      }
   } while (0);

   (void)atcab_release();

   return status;
}