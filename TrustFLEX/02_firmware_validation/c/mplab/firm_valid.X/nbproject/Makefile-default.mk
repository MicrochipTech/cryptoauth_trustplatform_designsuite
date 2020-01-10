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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/firm_valid.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/firm_valid.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../../../../../assets/dependencies/common/common.c ../../../../../assets/dependencies/common/host_rand_number.c config/default/peripheral/clock/plib_clock.c config/default/peripheral/evsys/plib_evsys.c config/default/peripheral/nvic/plib_nvic.c config/default/peripheral/nvmctrl/plib_nvmctrl.c config/default/peripheral/port/plib_port.c config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.c config/default/peripheral/sercom/usart/plib_sercom3_usart.c config/default/stdio/xc32_monitor.c config/default/exceptions.c config/default/initialization.c config/default/interrupts.c config/default/libc_syscalls.c config/default/startup_xc32.c ../../firm_valid.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c hal_core_m0plus_base.c hal_delay.c hal_i2c_harmony.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/944760972/common.o ${OBJECTDIR}/_ext/944760972/host_rand_number.o ${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o ${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o ${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o ${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o ${OBJECTDIR}/config/default/peripheral/port/plib_port.o ${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o ${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o ${OBJECTDIR}/config/default/stdio/xc32_monitor.o ${OBJECTDIR}/config/default/exceptions.o ${OBJECTDIR}/config/default/initialization.o ${OBJECTDIR}/config/default/interrupts.o ${OBJECTDIR}/config/default/libc_syscalls.o ${OBJECTDIR}/config/default/startup_xc32.o ${OBJECTDIR}/_ext/43898991/firm_valid.o ${OBJECTDIR}/_ext/1540212731/atcacert_client.o ${OBJECTDIR}/_ext/1540212731/atcacert_date.o ${OBJECTDIR}/_ext/1540212731/atcacert_def.o ${OBJECTDIR}/_ext/1540212731/atcacert_der.o ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o ${OBJECTDIR}/_ext/434103448/atca_basic.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_info.o ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o ${OBJECTDIR}/_ext/434103448/atca_basic_random.o ${OBJECTDIR}/_ext/434103448/atca_basic_read.o ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o ${OBJECTDIR}/_ext/434103448/atca_basic_write.o ${OBJECTDIR}/_ext/434103448/atca_helpers.o ${OBJECTDIR}/_ext/650572932/sha1_routines.o ${OBJECTDIR}/_ext/650572932/sha2_routines.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o ${OBJECTDIR}/_ext/1412734899/atca_hal.o ${OBJECTDIR}/_ext/845095122/atca_host.o ${OBJECTDIR}/_ext/1412732287/atca_jwt.o ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o ${OBJECTDIR}/_ext/1442710327/atca_command.o ${OBJECTDIR}/_ext/1442710327/atca_device.o ${OBJECTDIR}/_ext/1442710327/atca_execution.o ${OBJECTDIR}/_ext/1442710327/atca_iface.o ${OBJECTDIR}/hal_core_m0plus_base.o ${OBJECTDIR}/hal_delay.o ${OBJECTDIR}/hal_i2c_harmony.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/944760972/common.o.d ${OBJECTDIR}/_ext/944760972/host_rand_number.o.d ${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o.d ${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o.d ${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o.d ${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o.d ${OBJECTDIR}/config/default/peripheral/port/plib_port.o.d ${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o.d ${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o.d ${OBJECTDIR}/config/default/stdio/xc32_monitor.o.d ${OBJECTDIR}/config/default/exceptions.o.d ${OBJECTDIR}/config/default/initialization.o.d ${OBJECTDIR}/config/default/interrupts.o.d ${OBJECTDIR}/config/default/libc_syscalls.o.d ${OBJECTDIR}/config/default/startup_xc32.o.d ${OBJECTDIR}/_ext/43898991/firm_valid.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d ${OBJECTDIR}/_ext/434103448/atca_basic.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d ${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d ${OBJECTDIR}/_ext/434103448/atca_helpers.o.d ${OBJECTDIR}/_ext/650572932/sha1_routines.o.d ${OBJECTDIR}/_ext/650572932/sha2_routines.o.d ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d ${OBJECTDIR}/_ext/1412734899/atca_hal.o.d ${OBJECTDIR}/_ext/845095122/atca_host.o.d ${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d ${OBJECTDIR}/_ext/1442710327/atca_command.o.d ${OBJECTDIR}/_ext/1442710327/atca_device.o.d ${OBJECTDIR}/_ext/1442710327/atca_execution.o.d ${OBJECTDIR}/_ext/1442710327/atca_iface.o.d ${OBJECTDIR}/hal_core_m0plus_base.o.d ${OBJECTDIR}/hal_delay.o.d ${OBJECTDIR}/hal_i2c_harmony.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/944760972/common.o ${OBJECTDIR}/_ext/944760972/host_rand_number.o ${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o ${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o ${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o ${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o ${OBJECTDIR}/config/default/peripheral/port/plib_port.o ${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o ${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o ${OBJECTDIR}/config/default/stdio/xc32_monitor.o ${OBJECTDIR}/config/default/exceptions.o ${OBJECTDIR}/config/default/initialization.o ${OBJECTDIR}/config/default/interrupts.o ${OBJECTDIR}/config/default/libc_syscalls.o ${OBJECTDIR}/config/default/startup_xc32.o ${OBJECTDIR}/_ext/43898991/firm_valid.o ${OBJECTDIR}/_ext/1540212731/atcacert_client.o ${OBJECTDIR}/_ext/1540212731/atcacert_date.o ${OBJECTDIR}/_ext/1540212731/atcacert_def.o ${OBJECTDIR}/_ext/1540212731/atcacert_der.o ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o ${OBJECTDIR}/_ext/434103448/atca_basic.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o ${OBJECTDIR}/_ext/434103448/atca_basic_info.o ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o ${OBJECTDIR}/_ext/434103448/atca_basic_random.o ${OBJECTDIR}/_ext/434103448/atca_basic_read.o ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o ${OBJECTDIR}/_ext/434103448/atca_basic_write.o ${OBJECTDIR}/_ext/434103448/atca_helpers.o ${OBJECTDIR}/_ext/650572932/sha1_routines.o ${OBJECTDIR}/_ext/650572932/sha2_routines.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o ${OBJECTDIR}/_ext/1412734899/atca_hal.o ${OBJECTDIR}/_ext/845095122/atca_host.o ${OBJECTDIR}/_ext/1412732287/atca_jwt.o ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o ${OBJECTDIR}/_ext/1442710327/atca_command.o ${OBJECTDIR}/_ext/1442710327/atca_device.o ${OBJECTDIR}/_ext/1442710327/atca_execution.o ${OBJECTDIR}/_ext/1442710327/atca_iface.o ${OBJECTDIR}/hal_core_m0plus_base.o ${OBJECTDIR}/hal_delay.o ${OBJECTDIR}/hal_i2c_harmony.o

# Source Files
SOURCEFILES=../../../../../assets/dependencies/common/common.c ../../../../../assets/dependencies/common/host_rand_number.c config/default/peripheral/clock/plib_clock.c config/default/peripheral/evsys/plib_evsys.c config/default/peripheral/nvic/plib_nvic.c config/default/peripheral/nvmctrl/plib_nvmctrl.c config/default/peripheral/port/plib_port.c config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.c config/default/peripheral/sercom/usart/plib_sercom3_usart.c config/default/stdio/xc32_monitor.c config/default/exceptions.c config/default/initialization.c config/default/interrupts.c config/default/libc_syscalls.c config/default/startup_xc32.c ../../firm_valid.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c hal_core_m0plus_base.c hal_delay.c hal_i2c_harmony.c



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

# The following macros may be used in the pre and post step lines
Device=ATSAMD21E18A
ProjectDir="E:\develop-usecasetool\usecasetool\TrustFLEX\02_firmware_validation\c\mplab\firm_valid.X"
ProjectName=firm_valid
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\firm_valid.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="firm_valid.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/firm_valid.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: [cp ${ImagePath} ..\..\..\..\02_firmware_validation\notebook]"
	@cp ${ImagePath} ..\..\..\..\02_firmware_validation\notebook
	@echo "--------------------------------------"

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
	@${FIXDEPS} "${OBJECTDIR}/_ext/944760972/common.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/944760972/common.o.d" -o ${OBJECTDIR}/_ext/944760972/common.o ../../../../../assets/dependencies/common/common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/944760972/host_rand_number.o: ../../../../../assets/dependencies/common/host_rand_number.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/944760972" 
	@${RM} ${OBJECTDIR}/_ext/944760972/host_rand_number.o.d 
	@${RM} ${OBJECTDIR}/_ext/944760972/host_rand_number.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/944760972/host_rand_number.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/944760972/host_rand_number.o.d" -o ${OBJECTDIR}/_ext/944760972/host_rand_number.o ../../../../../assets/dependencies/common/host_rand_number.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o: config/default/peripheral/clock/plib_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/clock" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o.d" -o ${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o config/default/peripheral/clock/plib_clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o: config/default/peripheral/evsys/plib_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/evsys" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o.d" -o ${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o config/default/peripheral/evsys/plib_evsys.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o: config/default/peripheral/nvic/plib_nvic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/nvic" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o.d" -o ${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o config/default/peripheral/nvic/plib_nvic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o: config/default/peripheral/nvmctrl/plib_nvmctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/nvmctrl" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o.d" -o ${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o config/default/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/port/plib_port.o: config/default/peripheral/port/plib_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/port" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/port/plib_port.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/port/plib_port.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/port/plib_port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/port/plib_port.o.d" -o ${OBJECTDIR}/config/default/peripheral/port/plib_port.o config/default/peripheral/port/plib_port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o: config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/sercom/i2cm" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o.d" -o ${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o: config/default/peripheral/sercom/usart/plib_sercom3_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/sercom/usart" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o.d" -o ${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o config/default/peripheral/sercom/usart/plib_sercom3_usart.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/stdio/xc32_monitor.o: config/default/stdio/xc32_monitor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/stdio" 
	@${RM} ${OBJECTDIR}/config/default/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/config/default/stdio/xc32_monitor.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/stdio/xc32_monitor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/config/default/stdio/xc32_monitor.o config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/exceptions.o: config/default/exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default" 
	@${RM} ${OBJECTDIR}/config/default/exceptions.o.d 
	@${RM} ${OBJECTDIR}/config/default/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/exceptions.o.d" -o ${OBJECTDIR}/config/default/exceptions.o config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/initialization.o: config/default/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default" 
	@${RM} ${OBJECTDIR}/config/default/initialization.o.d 
	@${RM} ${OBJECTDIR}/config/default/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/initialization.o.d" -o ${OBJECTDIR}/config/default/initialization.o config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/interrupts.o: config/default/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default" 
	@${RM} ${OBJECTDIR}/config/default/interrupts.o.d 
	@${RM} ${OBJECTDIR}/config/default/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/interrupts.o.d" -o ${OBJECTDIR}/config/default/interrupts.o config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/libc_syscalls.o: config/default/libc_syscalls.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default" 
	@${RM} ${OBJECTDIR}/config/default/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/config/default/libc_syscalls.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/libc_syscalls.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/libc_syscalls.o.d" -o ${OBJECTDIR}/config/default/libc_syscalls.o config/default/libc_syscalls.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/startup_xc32.o: config/default/startup_xc32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default" 
	@${RM} ${OBJECTDIR}/config/default/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/config/default/startup_xc32.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/startup_xc32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/startup_xc32.o.d" -o ${OBJECTDIR}/config/default/startup_xc32.o config/default/startup_xc32.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/43898991/firm_valid.o: ../../firm_valid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/firm_valid.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/firm_valid.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/43898991/firm_valid.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/43898991/firm_valid.o.d" -o ${OBJECTDIR}/_ext/43898991/firm_valid.o ../../firm_valid.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_client.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_client.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_client.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_date.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_date.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_date.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_def.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_def.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_def.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_der.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_der.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_der.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_pem.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_counter.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_info.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_info.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_info.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_lock.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_mac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_random.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_random.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_random.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_read.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_read.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_read.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_sha.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_sign.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_verify.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_write.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_write.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_write.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_helpers.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_helpers.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_helpers.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/650572932/sha1_routines.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/650572932" 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha1_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha1_routines.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/650572932/sha1_routines.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/650572932/sha1_routines.o.d" -o ${OBJECTDIR}/_ext/650572932/sha1_routines.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/650572932/sha2_routines.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/650572932" 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha2_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha2_routines.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/650572932/sha2_routines.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/650572932/sha2_routines.o.d" -o ${OBJECTDIR}/_ext/650572932/sha2_routines.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1412734899/atca_hal.o: ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1412734899" 
	@${RM} ${OBJECTDIR}/_ext/1412734899/atca_hal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1412734899/atca_hal.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1412734899/atca_hal.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1412734899/atca_hal.o.d" -o ${OBJECTDIR}/_ext/1412734899/atca_hal.o ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/845095122/atca_host.o: ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/845095122" 
	@${RM} ${OBJECTDIR}/_ext/845095122/atca_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/845095122/atca_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/845095122/atca_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/845095122/atca_host.o.d" -o ${OBJECTDIR}/_ext/845095122/atca_host.o ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1412732287/atca_jwt.o: ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1412732287" 
	@${RM} ${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1412732287/atca_jwt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d" -o ${OBJECTDIR}/_ext/1412732287/atca_jwt.o ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1442710327/atca_cfgs.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1442710327/atca_command.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_command.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_command.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_command.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_command.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1442710327/atca_device.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_device.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_device.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1442710327/atca_execution.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_execution.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_execution.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_execution.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_execution.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_execution.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1442710327/atca_iface.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_iface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_iface.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_iface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_iface.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_iface.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/hal_core_m0plus_base.o: hal_core_m0plus_base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hal_core_m0plus_base.o.d 
	@${RM} ${OBJECTDIR}/hal_core_m0plus_base.o 
	@${FIXDEPS} "${OBJECTDIR}/hal_core_m0plus_base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/hal_core_m0plus_base.o.d" -o ${OBJECTDIR}/hal_core_m0plus_base.o hal_core_m0plus_base.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/hal_delay.o: hal_delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hal_delay.o.d 
	@${RM} ${OBJECTDIR}/hal_delay.o 
	@${FIXDEPS} "${OBJECTDIR}/hal_delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/hal_delay.o.d" -o ${OBJECTDIR}/hal_delay.o hal_delay.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/hal_i2c_harmony.o: hal_i2c_harmony.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hal_i2c_harmony.o.d 
	@${RM} ${OBJECTDIR}/hal_i2c_harmony.o 
	@${FIXDEPS} "${OBJECTDIR}/hal_i2c_harmony.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/hal_i2c_harmony.o.d" -o ${OBJECTDIR}/hal_i2c_harmony.o hal_i2c_harmony.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/_ext/944760972/common.o: ../../../../../assets/dependencies/common/common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/944760972" 
	@${RM} ${OBJECTDIR}/_ext/944760972/common.o.d 
	@${RM} ${OBJECTDIR}/_ext/944760972/common.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/944760972/common.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/944760972/common.o.d" -o ${OBJECTDIR}/_ext/944760972/common.o ../../../../../assets/dependencies/common/common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/944760972/host_rand_number.o: ../../../../../assets/dependencies/common/host_rand_number.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/944760972" 
	@${RM} ${OBJECTDIR}/_ext/944760972/host_rand_number.o.d 
	@${RM} ${OBJECTDIR}/_ext/944760972/host_rand_number.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/944760972/host_rand_number.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/944760972/host_rand_number.o.d" -o ${OBJECTDIR}/_ext/944760972/host_rand_number.o ../../../../../assets/dependencies/common/host_rand_number.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o: config/default/peripheral/clock/plib_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/clock" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o.d" -o ${OBJECTDIR}/config/default/peripheral/clock/plib_clock.o config/default/peripheral/clock/plib_clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o: config/default/peripheral/evsys/plib_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/evsys" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o.d" -o ${OBJECTDIR}/config/default/peripheral/evsys/plib_evsys.o config/default/peripheral/evsys/plib_evsys.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o: config/default/peripheral/nvic/plib_nvic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/nvic" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o.d" -o ${OBJECTDIR}/config/default/peripheral/nvic/plib_nvic.o config/default/peripheral/nvic/plib_nvic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o: config/default/peripheral/nvmctrl/plib_nvmctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/nvmctrl" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o.d" -o ${OBJECTDIR}/config/default/peripheral/nvmctrl/plib_nvmctrl.o config/default/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/port/plib_port.o: config/default/peripheral/port/plib_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/port" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/port/plib_port.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/port/plib_port.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/port/plib_port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/port/plib_port.o.d" -o ${OBJECTDIR}/config/default/peripheral/port/plib_port.o config/default/peripheral/port/plib_port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o: config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/sercom/i2cm" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o.d" -o ${OBJECTDIR}/config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.o config/default/peripheral/sercom/i2cm/plib_sercom2_i2c.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o: config/default/peripheral/sercom/usart/plib_sercom3_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/peripheral/sercom/usart" 
	@${RM} ${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o.d 
	@${RM} ${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o.d" -o ${OBJECTDIR}/config/default/peripheral/sercom/usart/plib_sercom3_usart.o config/default/peripheral/sercom/usart/plib_sercom3_usart.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/stdio/xc32_monitor.o: config/default/stdio/xc32_monitor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default/stdio" 
	@${RM} ${OBJECTDIR}/config/default/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/config/default/stdio/xc32_monitor.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/stdio/xc32_monitor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/config/default/stdio/xc32_monitor.o config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/exceptions.o: config/default/exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default" 
	@${RM} ${OBJECTDIR}/config/default/exceptions.o.d 
	@${RM} ${OBJECTDIR}/config/default/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/exceptions.o.d" -o ${OBJECTDIR}/config/default/exceptions.o config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/initialization.o: config/default/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default" 
	@${RM} ${OBJECTDIR}/config/default/initialization.o.d 
	@${RM} ${OBJECTDIR}/config/default/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/initialization.o.d" -o ${OBJECTDIR}/config/default/initialization.o config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/interrupts.o: config/default/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default" 
	@${RM} ${OBJECTDIR}/config/default/interrupts.o.d 
	@${RM} ${OBJECTDIR}/config/default/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/interrupts.o.d" -o ${OBJECTDIR}/config/default/interrupts.o config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/libc_syscalls.o: config/default/libc_syscalls.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default" 
	@${RM} ${OBJECTDIR}/config/default/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/config/default/libc_syscalls.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/libc_syscalls.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/libc_syscalls.o.d" -o ${OBJECTDIR}/config/default/libc_syscalls.o config/default/libc_syscalls.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/config/default/startup_xc32.o: config/default/startup_xc32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/config/default" 
	@${RM} ${OBJECTDIR}/config/default/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/config/default/startup_xc32.o 
	@${FIXDEPS} "${OBJECTDIR}/config/default/startup_xc32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/config/default/startup_xc32.o.d" -o ${OBJECTDIR}/config/default/startup_xc32.o config/default/startup_xc32.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/43898991/firm_valid.o: ../../firm_valid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/firm_valid.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/firm_valid.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/43898991/firm_valid.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/43898991/firm_valid.o.d" -o ${OBJECTDIR}/_ext/43898991/firm_valid.o ../../firm_valid.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_client.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_client.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_client.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_client.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_client.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_date.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_date.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_date.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_date.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_date.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_def.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_def.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_def.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_def.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_def.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_der.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_der.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_der.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_der.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_der.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_host_hw.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_hw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_host_sw.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_host_sw.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1540212731/atcacert_pem.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1540212731" 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1540212731/atcacert_pem.o.d" -o ${OBJECTDIR}/_ext/1540212731/atcacert_pem.o ../../../../../assets/dependencies/cryptoauthlib/lib/atcacert/atcacert_pem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cbc.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cbc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_cmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_cmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_ctr.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_ctr.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_aes_gcm.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_aes_gcm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_checkmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_checkmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_counter.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_counter.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_counter.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_counter.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_derivekey.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_derivekey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_ecdh.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_ecdh.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_gendig.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_gendig.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_genkey.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_genkey.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_hmac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_hmac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_info.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_info.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_info.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_info.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_info.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_kdf.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_kdf.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_lock.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_lock.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_lock.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_lock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_mac.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_mac.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_mac.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_mac.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_nonce.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_nonce.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_privwrite.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_privwrite.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_random.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_random.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_random.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_random.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_random.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_read.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_read.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_read.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_read.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_read.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_secureboot.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_secureboot.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_selftest.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_selftest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_sha.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_sha.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_sha.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sha.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_sign.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_sign.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_sign.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_sign.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_updateextra.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_updateextra.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_verify.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_verify.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_verify.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_verify.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_basic_write.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_basic_write.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_basic_write.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_basic_write.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_basic_write.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/434103448/atca_helpers.o: ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/434103448" 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/434103448/atca_helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/434103448/atca_helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/434103448/atca_helpers.o.d" -o ${OBJECTDIR}/_ext/434103448/atca_helpers.o ../../../../../assets/dependencies/cryptoauthlib/lib/basic/atca_helpers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/650572932/sha1_routines.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/650572932" 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha1_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha1_routines.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/650572932/sha1_routines.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/650572932/sha1_routines.o.d" -o ${OBJECTDIR}/_ext/650572932/sha1_routines.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha1_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/650572932/sha2_routines.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/650572932" 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha2_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/650572932/sha2_routines.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/650572932/sha2_routines.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/650572932/sha2_routines.o.d" -o ${OBJECTDIR}/_ext/650572932/sha2_routines.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/hashes/sha2_routines.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_ecdsa.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_ecdsa.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_rand.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_rand.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha1.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o: ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/527789881" 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d 
	@${RM} ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o.d" -o ${OBJECTDIR}/_ext/527789881/atca_crypto_sw_sha2.o ../../../../../assets/dependencies/cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1412734899/atca_hal.o: ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1412734899" 
	@${RM} ${OBJECTDIR}/_ext/1412734899/atca_hal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1412734899/atca_hal.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1412734899/atca_hal.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1412734899/atca_hal.o.d" -o ${OBJECTDIR}/_ext/1412734899/atca_hal.o ../../../../../assets/dependencies/cryptoauthlib/lib/hal/atca_hal.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/845095122/atca_host.o: ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/845095122" 
	@${RM} ${OBJECTDIR}/_ext/845095122/atca_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/845095122/atca_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/845095122/atca_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/845095122/atca_host.o.d" -o ${OBJECTDIR}/_ext/845095122/atca_host.o ../../../../../assets/dependencies/cryptoauthlib/lib/host/atca_host.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1412732287/atca_jwt.o: ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1412732287" 
	@${RM} ${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1412732287/atca_jwt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1412732287/atca_jwt.o.d" -o ${OBJECTDIR}/_ext/1412732287/atca_jwt.o ../../../../../assets/dependencies/cryptoauthlib/lib/jwt/atca_jwt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1442710327/atca_cfgs.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_cfgs.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_cfgs.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_cfgs.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1442710327/atca_command.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_command.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_command.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_command.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_command.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_command.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1442710327/atca_device.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_device.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_device.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1442710327/atca_execution.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_execution.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_execution.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_execution.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_execution.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_execution.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_execution.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1442710327/atca_iface.o: ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1442710327" 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_iface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1442710327/atca_iface.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1442710327/atca_iface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/_ext/1442710327/atca_iface.o.d" -o ${OBJECTDIR}/_ext/1442710327/atca_iface.o ../../../../../assets/dependencies/cryptoauthlib/lib/atca_iface.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/hal_core_m0plus_base.o: hal_core_m0plus_base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hal_core_m0plus_base.o.d 
	@${RM} ${OBJECTDIR}/hal_core_m0plus_base.o 
	@${FIXDEPS} "${OBJECTDIR}/hal_core_m0plus_base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/hal_core_m0plus_base.o.d" -o ${OBJECTDIR}/hal_core_m0plus_base.o hal_core_m0plus_base.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/hal_delay.o: hal_delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hal_delay.o.d 
	@${RM} ${OBJECTDIR}/hal_delay.o 
	@${FIXDEPS} "${OBJECTDIR}/hal_delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/hal_delay.o.d" -o ${OBJECTDIR}/hal_delay.o hal_delay.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/hal_i2c_harmony.o: hal_i2c_harmony.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hal_i2c_harmony.o.d 
	@${RM} ${OBJECTDIR}/hal_i2c_harmony.o 
	@${FIXDEPS} "${OBJECTDIR}/hal_i2c_harmony.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -DATCA_HAL_I2C -I"packs/ATSAMD21J18A_DFP" -I"packs/CMSIS/CMSIS/Core/Include" -I"packs/CMSIS" -I"config/default" -I"../../../../../assets/dependencies/common" -I"../../../../../assets/dependencies/cryptoauthlib/lib" -Wall -MMD -MF "${OBJECTDIR}/hal_i2c_harmony.o.d" -o ${OBJECTDIR}/hal_i2c_harmony.o hal_i2c_harmony.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/firm_valid.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/firm_valid.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/firm_valid.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/firm_valid.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/firm_valid.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
