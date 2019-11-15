#ifndef _COMMON_H
#define _COMMON_H

#include "cryptoauthlib.h"


#ifdef __cplusplus
extern "C" {
#endif

#define IO_PROTECTION_KEY_SLOT 6

extern ATCAIfaceCfg cfg_tflxtls;

extern ATCAIfaceCfg cfg_tngtls;
   
ATCAIfaceCfg * get_device_details(int argc, char* argv[]);
ATCADeviceType get_device_type_id(uint8_t dev_rev);
ATCA_STATUS check_device_type_in_cfg(ATCAIfaceCfg* cfg, bool overwrite);

#ifdef __cplusplus
}
#endif
#endif
