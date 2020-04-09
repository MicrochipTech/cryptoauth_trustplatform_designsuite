#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/asymmetric_auth.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/asymmetric_auth.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../../../../assets/dependencies/common/common.c ../../../../../assets/dependencies/common/host_rand_number.c ../src/config/default/peripheral/clock/plib_clock.c ../src/config/default/peripheral/evsys/plib_evsys.c ../src/config/default/peripheral/nvic/plib_nvic.c ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/default/peripheral/port/plib_port.c ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/default/peripheral/sercom/usart/plib_sercom3_usart.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c ../src/config/default/startup_xc32.c ../src/config/default/libc_syscalls.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_1_signer.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_2_device.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_4_device.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_1_signer.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_2_device.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_3_device.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atca.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atcacert_client.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_root_cert.c ../src/hal_core_m0plus_base.c ../src/hal_delay.c ../src/hal_i2c_harmony.c ../../asymmetric_auth.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/944760972/common.o ${OBJECTDIR}/_ext/944760972/host_rand_number.o ${OBJECTDIR}/_ext/1984496892/plib_clock.o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o ${OBJECTDIR}/_ext/1865521619/plib_port.o ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ${OBJECTDIR}/_ext/1540212731/atcacert_client.o ${OBJECTDIR}/_ext/1540212731/atcacert_date.o ${OBJECTDIR}/_ext/1540212731/atcacert_def.o ${OBJECTDIR}/_ext/1540212731/atcacert_der.o ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o ${OBJECTDIR}/_ext/434103448/atca_basic.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_info.o ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o ${OBJECTDIR}/_ext/434103448/atca_basic_random.o ${OBJECTDIR}/_ext/434103448/atca_basic_read.o ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o ${OBJECTDIR}/_ext/434103448/atca_basic_write.o ${OBJECTDIR}/_ext/434103448/atca_helpers.o ${OBJECTDIR}/_ext/650572932/sha1_routines.o ${OBJECTDIR}/_ext/650572932/sha2_routines.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o ${OBJECTDIR}/_ext/1412734899/atca_hal.o ${OBJECTDIR}/_ext/845095122/atca_host.o ${OBJECTDIR}/_ext/1412732287/atca_jwt.o ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o ${OBJECTDIR}/_ext/1442710327/atca_command.o ${OBJECTDIR}/_ext/1442710327/atca_device.o ${OBJECTDIR}/_ext/1442710327/atca_execution.o ${OBJECTDIR}/_ext/1442710327/atca_iface.o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o ${OBJECTDIR}/_ext/1922971779/tng_atca.o ${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o ${OBJECTDIR}/_ext/1922971779/tng_root_cert.o ${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o ${OBJECTDIR}/_ext/1360937237/hal_delay.o ${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o ${OBJECTDIR}/_ext/43898991/asymmetric_auth.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/944760972/common.o.d ${OBJECTDIR}/_ext/944760972/host_rand_number.o.d ${OBJECTDIR}/_ext/1984496892/plib_clock.o.d ${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d ${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d ${OBJECTDIR}/_ext/1865521619/plib_port.o.d ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d ${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o.d ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d ${OBJECTDIR}/_ext/1171490990/initialization.o.d ${OBJECTDIR}/_ext/1171490990/interrupts.o.d ${OBJECTDIR}/_ext/1171490990/exceptions.o.d ${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d ${OBJECTDIR}/_ext/434103448/atca_basic.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d ${OBJECTDIR}/_ext/434103448/atca_helpers.o.d ${OBJECTDIR}/_ext/650572932/sha1_routines.o.d ${OBJECTDIR}/_ext/650572932/sha2_routines.o.d ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d ${OBJECTDIR}/_ext/1412734899/atca_hal.o.d ${OBJECTDIR}/_ext/845095122/atca_host.o.d ${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d ${OBJECTDIR}/_ext/1442710327/atca_command.o.d ${OBJECTDIR}/_ext/1442710327/atca_device.o.d ${OBJECTDIR}/_ext/1442710327/atca_execution.o.d ${OBJECTDIR}/_ext/1442710327/atca_iface.o.d ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o.d ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o.d ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o.d ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o.d ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o.d ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o.d ${OBJECTDIR}/_ext/1922971779/tng_atca.o.d ${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o.d ${OBJECTDIR}/_ext/1922971779/tng_root_cert.o.d ${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o.d ${OBJECTDIR}/_ext/1360937237/hal_delay.o.d ${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o.d ${OBJECTDIR}/_ext/43898991/asymmetric_auth.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/944760972/common.o ${OBJECTDIR}/_ext/944760972/host_rand_number.o ${OBJECTDIR}/_ext/1984496892/plib_clock.o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o ${OBJECTDIR}/_ext/1865521619/plib_port.o ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o ${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ${OBJECTDIR}/_ext/1540212731/atcacert_client.o ${OBJECTDIR}/_ext/1540212731/atcacert_date.o ${OBJECTDIR}/_ext/1540212731/atcacert_def.o ${OBJECTDIR}/_ext/1540212731/atcacert_der.o ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o ${OBJECTDIR}/_ext/434103448/atca_basic.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_info.o ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o ${OBJECTDIR}/_ext/434103448/atca_basic_random.o ${OBJECTDIR}/_ext/434103448/atca_basic_read.o ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o ${OBJECTDIR}/_ext/434103448/atca_basic_write.o ${OBJECTDIR}/_ext/434103448/atca_helpers.o ${OBJECTDIR}/_ext/650572932/sha1_routines.o ${OBJECTDIR}/_ext/650572932/sha2_routines.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o ${OBJECTDIR}/_ext/1412734899/atca_hal.o ${OBJECTDIR}/_ext/845095122/atca_host.o ${OBJECTDIR}/_ext/1412732287/atca_jwt.o ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o ${OBJECTDIR}/_ext/1442710327/atca_command.o ${OBJECTDIR}/_ext/1442710327/atca_device.o ${OBJECTDIR}/_ext/1442710327/atca_execution.o ${OBJECTDIR}/_ext/1442710327/atca_iface.o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o ${OBJECTDIR}/_ext/1922971779/tng_atca.o ${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o ${OBJECTDIR}/_ext/1922971779/tng_root_cert.o ${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o ${OBJECTDIR}/_ext/1360937237/hal_delay.o ${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o ${OBJECTDIR}/_ext/43898991/asymmetric_auth.o

# Source Files
SOURCEFILES=../../../../../assets/dependencies/common/common.c ../../../../../assets/dependencies/common/host_rand_number.c ../src/config/default/peripheral/clock/plib_clock.c ../src/config/default/peripheral/evsys/plib_evsys.c ../src/config/default/peripheral/nvic/plib_nvic.c ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/default/peripheral/port/plib_port.c ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c ../src/config/default/peripheral/sercom/usart/plib_sercom3_usart.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/config/default/exceptions.c ../src/config/default/startup_xc32.c ../src/config/default/libc_syscalls.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_1_signer.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_2_device.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_4_device.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_1_signer.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_2_device.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_3_device.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atca.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atcacert_client.c ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_root_cert.c ../src/hal_core_m0plus_base.c ../src/hal_delay.c ../src/hal_i2c_harmony.c ../../asymmetric_auth.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/asymmetric_auth.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATSAMD21E18A
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/944760972/common.o: ../../../../../assets/dependencies/common/common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/944760972" 
	@${RM} ${OBJECTDIR}/_ext/944760972/common.o.d 
	@${RM} ${OBJECTDIR}/_ext/944760972/common.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/944760972/common.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/944760972/common.o.d" -o ${OBJECTDIR}/_ext/944760972/common.o ../../../../../assets/dependencies/common/common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/944760972/host_rand_number.o: ../../../../../assets/dependencies/common/host_rand_number.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/944760972" 
	@${RM} ${OBJECTDIR}/_ext/944760972/host_rand_number.o.d 
	@${RM} ${OBJECTDIR}/_ext/944760972/host_rand_number.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/944760972/host_rand_number.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/944760972/host_rand_number.o.d" -o ${OBJECTDIR}/_ext/944760972/host_rand_number.o ../../../../../assets/dependencies/common/host_rand_number.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1984496892/plib_clock.o: ../src/config/default/peripheral/clock/plib_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1984496892" 
	@${RM} ${OBJECTDIR}/_ext/1984496892/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1984496892/plib_clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1984496892/plib_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1984496892/plib_clock.o.d" -o ${OBJECTDIR}/_ext/1984496892/plib_clock.o ../src/config/default/peripheral/clock/plib_clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1986646378/plib_evsys.o: ../src/config/default/peripheral/evsys/plib_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1986646378" 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ../src/config/default/peripheral/evsys/plib_evsys.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1865468468/plib_nvic.o: ../src/config/default/peripheral/nvic/plib_nvic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1865468468" 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ../src/config/default/peripheral/nvic/plib_nvic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o: ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1593096446" 
	@${RM} ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1865521619/plib_port.o: ../src/config/default/peripheral/port/plib_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1865521619" 
	@${RM} ${OBJECTDIR}/_ext/1865521619/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865521619/plib_port.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1865521619/plib_port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1865521619/plib_port.o.d" -o ${OBJECTDIR}/_ext/1865521619/plib_port.o ../src/config/default/peripheral/port/plib_port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o: ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/508257091" 
	@${RM} ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o: ../src/config/default/peripheral/sercom/usart/plib_sercom3_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/504274921" 
	@${RM} ${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o.d" -o ${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o ../src/config/default/peripheral/sercom/usart/plib_sercom3_usart.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1171490990/startup_xc32.o: ../src/config/default/startup_xc32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ../src/config/default/startup_xc32.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1171490990/libc_syscalls.o: ../src/config/default/libc_syscalls.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ../src/config/default/libc_syscalls.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_client.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_client.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_client.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_date.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_date.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_date.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_def.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_def.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_def.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_der.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_der.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_der.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_pem.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_counter.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_info.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_info.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_info.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_lock.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_mac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_random.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_random.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_random.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_read.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_read.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_read.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_sha.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_sign.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_verify.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_write.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_write.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_write.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_helpers.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_helpers.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_helpers.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/650572932/sha1_routines.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/650572932" 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha1_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha1_routines.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/650572932/sha1_routines.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/650572932/sha1_routines.o.d" -o ${OBJECTDIR}/_ext/650572932/sha1_routines.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/650572932/sha2_routines.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/650572932" 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha2_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha2_routines.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/650572932/sha2_routines.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/650572932/sha2_routines.o.d" -o ${OBJECTDIR}/_ext/650572932/sha2_routines.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1412734899/atca_hal.o: ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1412734899" 
	@${RM} ${OBJECTDIR}/_ext/1412734899/atca_hal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1412734899/atca_hal.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1412734899/atca_hal.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1412734899/atca_hal.o.d" -o ${OBJECTDIR}/_ext/1412734899/atca_hal.o ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/845095122/atca_host.o: ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/845095122" 
	@${RM} ${OBJECTDIR}/_ext/845095122/atca_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/845095122/atca_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/845095122/atca_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/845095122/atca_host.o.d" -o ${OBJECTDIR}/_ext/845095122/atca_host.o ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1412732287/atca_jwt.o: ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1412732287" 
	@${RM} ${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1412732287/atca_jwt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d" -o ${OBJECTDIR}/_ext/1412732287/atca_jwt.o ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1442710327/atca_cfgs.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1442710327/atca_command.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_command.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_command.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_command.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_command.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1442710327/atca_device.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_device.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_device.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1442710327/atca_execution.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_execution.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_execution.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_execution.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_execution.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_execution.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1442710327/atca_iface.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_iface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_iface.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_iface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_iface.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_iface.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_1_signer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o.d" -o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_1_signer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_2_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o.d" -o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_2_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_4_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o.d" -o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_4_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_1_signer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o.d" -o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_1_signer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_2_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o.d" -o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_2_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_3_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o.d" -o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_3_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tng_atca.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atca.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_atca.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_atca.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tng_atca.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tng_atca.o.d" -o ${OBJECTDIR}/_ext/1922971779/tng_atca.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atca.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atcacert_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o.d" -o ${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atcacert_client.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tng_root_cert.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_root_cert.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_root_cert.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_root_cert.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tng_root_cert.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tng_root_cert.o.d" -o ${OBJECTDIR}/_ext/1922971779/tng_root_cert.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_root_cert.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o: ../src/hal_core_m0plus_base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o.d" -o ${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o ../src/hal_core_m0plus_base.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1360937237/hal_delay.o: ../src/hal_delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/hal_delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1360937237/hal_delay.o.d" -o ${OBJECTDIR}/_ext/1360937237/hal_delay.o ../src/hal_delay.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o: ../src/hal_i2c_harmony.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o.d" -o ${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o ../src/hal_i2c_harmony.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/43898991/asymmetric_auth.o: ../../asymmetric_auth.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/asymmetric_auth.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/asymmetric_auth.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/43898991/asymmetric_auth.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/43898991/asymmetric_auth.o.d" -o ${OBJECTDIR}/_ext/43898991/asymmetric_auth.o ../../asymmetric_auth.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
else
${OBJECTDIR}/_ext/944760972/common.o: ../../../../../assets/dependencies/common/common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/944760972" 
	@${RM} ${OBJECTDIR}/_ext/944760972/common.o.d 
	@${RM} ${OBJECTDIR}/_ext/944760972/common.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/944760972/common.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/944760972/common.o.d" -o ${OBJECTDIR}/_ext/944760972/common.o ../../../../../assets/dependencies/common/common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/944760972/host_rand_number.o: ../../../../../assets/dependencies/common/host_rand_number.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/944760972" 
	@${RM} ${OBJECTDIR}/_ext/944760972/host_rand_number.o.d 
	@${RM} ${OBJECTDIR}/_ext/944760972/host_rand_number.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/944760972/host_rand_number.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/944760972/host_rand_number.o.d" -o ${OBJECTDIR}/_ext/944760972/host_rand_number.o ../../../../../assets/dependencies/common/host_rand_number.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1984496892/plib_clock.o: ../src/config/default/peripheral/clock/plib_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1984496892" 
	@${RM} ${OBJECTDIR}/_ext/1984496892/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1984496892/plib_clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1984496892/plib_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1984496892/plib_clock.o.d" -o ${OBJECTDIR}/_ext/1984496892/plib_clock.o ../src/config/default/peripheral/clock/plib_clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1986646378/plib_evsys.o: ../src/config/default/peripheral/evsys/plib_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1986646378" 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ../src/config/default/peripheral/evsys/plib_evsys.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1865468468/plib_nvic.o: ../src/config/default/peripheral/nvic/plib_nvic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1865468468" 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ../src/config/default/peripheral/nvic/plib_nvic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o: ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1593096446" 
	@${RM} ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1593096446/plib_nvmctrl.o ../src/config/default/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1865521619/plib_port.o: ../src/config/default/peripheral/port/plib_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1865521619" 
	@${RM} ${OBJECTDIR}/_ext/1865521619/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865521619/plib_port.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1865521619/plib_port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1865521619/plib_port.o.d" -o ${OBJECTDIR}/_ext/1865521619/plib_port.o ../src/config/default/peripheral/port/plib_port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o: ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/508257091" 
	@${RM} ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o.d" -o ${OBJECTDIR}/_ext/508257091/plib_sercom2_i2c_master.o ../src/config/default/peripheral/sercom/i2c_master/plib_sercom2_i2c_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o: ../src/config/default/peripheral/sercom/usart/plib_sercom3_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/504274921" 
	@${RM} ${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o.d" -o ${OBJECTDIR}/_ext/504274921/plib_sercom3_usart.o ../src/config/default/peripheral/sercom/usart/plib_sercom3_usart.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1171490990/startup_xc32.o: ../src/config/default/startup_xc32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ../src/config/default/startup_xc32.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1171490990/libc_syscalls.o: ../src/config/default/libc_syscalls.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ../src/config/default/libc_syscalls.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_client.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_client.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_client.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_date.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_date.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_date.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_def.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_def.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_def.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_der.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_der.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_der.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1540212731/atcacert_pem.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_counter.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_info.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_info.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_info.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_lock.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_mac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_random.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_random.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_random.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_read.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_read.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_read.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_sha.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_sign.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_verify.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_basic_write.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_write.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_write.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/434103448/atca_helpers.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_helpers.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_helpers.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/650572932/sha1_routines.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/650572932" 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha1_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha1_routines.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/650572932/sha1_routines.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/650572932/sha1_routines.o.d" -o ${OBJECTDIR}/_ext/650572932/sha1_routines.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/650572932/sha2_routines.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/650572932" 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha2_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha2_routines.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/650572932/sha2_routines.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/650572932/sha2_routines.o.d" -o ${OBJECTDIR}/_ext/650572932/sha2_routines.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1412734899/atca_hal.o: ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1412734899" 
	@${RM} ${OBJECTDIR}/_ext/1412734899/atca_hal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1412734899/atca_hal.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1412734899/atca_hal.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1412734899/atca_hal.o.d" -o ${OBJECTDIR}/_ext/1412734899/atca_hal.o ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/845095122/atca_host.o: ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/845095122" 
	@${RM} ${OBJECTDIR}/_ext/845095122/atca_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/845095122/atca_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/845095122/atca_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/845095122/atca_host.o.d" -o ${OBJECTDIR}/_ext/845095122/atca_host.o ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1412732287/atca_jwt.o: ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1412732287" 
	@${RM} ${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1412732287/atca_jwt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d" -o ${OBJECTDIR}/_ext/1412732287/atca_jwt.o ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1442710327/atca_cfgs.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1442710327/atca_command.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_command.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_command.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_command.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_command.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1442710327/atca_device.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_device.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_device.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1442710327/atca_execution.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_execution.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_execution.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_execution.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_execution.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_execution.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1442710327/atca_iface.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_iface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_iface.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_iface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_iface.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_iface.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_1_signer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o.d" -o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_1_signer.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_1_signer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_2_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o.d" -o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_2_device.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_2_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_4_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o.d" -o ${OBJECTDIR}/_ext/1922971779/tnglora_cert_def_4_device.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tnglora_cert_def_4_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_1_signer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o.d" -o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_1_signer.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_1_signer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_2_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o.d" -o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_2_device.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_2_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_3_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o.d" -o ${OBJECTDIR}/_ext/1922971779/tngtls_cert_def_3_device.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tngtls_cert_def_3_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tng_atca.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atca.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_atca.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_atca.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tng_atca.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tng_atca.o.d" -o ${OBJECTDIR}/_ext/1922971779/tng_atca.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atca.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atcacert_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o.d" -o ${OBJECTDIR}/_ext/1922971779/tng_atcacert_client.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_atcacert_client.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1922971779/tng_root_cert.o: ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_root_cert.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1922971779" 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_root_cert.o.d 
	@${RM} ${OBJECTDIR}/_ext/1922971779/tng_root_cert.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1922971779/tng_root_cert.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1922971779/tng_root_cert.o.d" -o ${OBJECTDIR}/_ext/1922971779/tng_root_cert.o ../../../../../assets/dependencies/cryptoauthlib/app/tng/tng_root_cert.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o: ../src/hal_core_m0plus_base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o.d" -o ${OBJECTDIR}/_ext/1360937237/hal_core_m0plus_base.o ../src/hal_core_m0plus_base.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1360937237/hal_delay.o: ../src/hal_delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/hal_delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1360937237/hal_delay.o.d" -o ${OBJECTDIR}/_ext/1360937237/hal_delay.o ../src/hal_delay.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o: ../src/hal_i2c_harmony.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o.d" -o ${OBJECTDIR}/_ext/1360937237/hal_i2c_harmony.o ../src/hal_i2c_harmony.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
${OBJECTDIR}/_ext/43898991/asymmetric_auth.o: ../../asymmetric_auth.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/asymmetric_auth.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/asymmetric_auth.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/43898991/asymmetric_auth.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -DATCAPRINTF -I"../src" -I"../src/config/default" -I"../src/packs/ATSAMD21E18A_DFP" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/CMSIS/" -I"../src/arm" -I"../../../../../assets/dependencies/cryptoauthlib/app/tng" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -I"../../../../../assets/dependencies/common" -MMD -MF "${OBJECTDIR}/_ext/43898991/asymmetric_auth.o.d" -o ${OBJECTDIR}/_ext/43898991/asymmetric_auth.o ../../asymmetric_auth.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}/samd21a
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/asymmetric_auth.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/asymmetric_auth.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}/samd21a
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/asymmetric_auth.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/asymmetric_auth.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}/samd21a
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/asymmetric_auth.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
