/*******************************************************************************
  WINC Driver TLS/SSL Header File

  Company:
    Microchip Technology Inc.

  File Name:
    wdrv_winc_ssl.h

  Summary:
    WINC wireless driver TLS/SSL header file.

  Description:
    Provides an interface to configure TLS/SSL support.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries.
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
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/
// DOM-IGNORE-END

#ifndef _WDRV_WINC_SSL_H
#define _WDRV_WINC_SSL_H

// *****************************************************************************
// *****************************************************************************
// Section: File includes
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>

#include "wdrv_winc_common.h"

// *****************************************************************************
// *****************************************************************************
// Section: WINC Driver TLS/SSL Data Types
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* List of IANA cipher suite IDs

  Summary:
    List of IANA cipher suite IDs.

  Description:
    These defines list the IANA cipher suite IDs.

  Remarks:
    None.

*/

#define WDRV_WINC_TLS_NULL_WITH_NULL_NULL                       0x0000
#define WDRV_WINC_TLS_RSA_WITH_AES_128_CBC_SHA                  0x002f
#define WDRV_WINC_TLS_RSA_WITH_AES_128_CBC_SHA256               0x003c
#define WDRV_WINC_TLS_DHE_RSA_WITH_AES_128_CBC_SHA              0x0033
#define WDRV_WINC_TLS_DHE_RSA_WITH_AES_128_CBC_SHA256           0x0067
#define WDRV_WINC_TLS_RSA_WITH_AES_128_GCM_SHA256               0x009c
#define WDRV_WINC_TLS_DHE_RSA_WITH_AES_128_GCM_SHA256           0x009e
#define WDRV_WINC_TLS_RSA_WITH_AES_256_CBC_SHA                  0x0035
#define WDRV_WINC_TLS_RSA_WITH_AES_256_CBC_SHA256               0x003d
#define WDRV_WINC_TLS_DHE_RSA_WITH_AES_256_CBC_SHA              0x0039
#define WDRV_WINC_TLS_DHE_RSA_WITH_AES_256_CBC_SHA256           0x006b
#define WDRV_WINC_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA            0xc013
#define WDRV_WINC_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA            0xc014
#define WDRV_WINC_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256         0xc027
#define WDRV_WINC_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256       0xc023
#define WDRV_WINC_TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256         0xc02f
#define WDRV_WINC_TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256       0xc02b

// *****************************************************************************
/*  Cipher Suite Context

  Summary:
    Cipher suite context structure.

  Description:
    This structure contains information about cipher suites.

  Remarks:
    None.
*/

typedef struct
{
    /* Bit mask of cipher suites. */
    uint32_t ciperSuites;
} WDRV_WINC_CIPHER_SUITE_CONTEXT;

// *****************************************************************************
/*  Set Cipher Suite List Callback

  Summary:
    Callback to report cipher suites.

  Description:
    Called when the cipher suites are changed.

  Parameters:
    handle              - Client handle obtained by a call to WDRV_WINC_Open.
    pSSLCipherSuiteCtx  - Pointer to cipher suite list.

  Returns:
    None.

  Remarks:
    None.
*/

typedef void (*WDRV_WINC_SSL_CIPHERSUITELIST_CALLBACK)
(
    DRV_HANDLE handle,
    WDRV_WINC_CIPHER_SUITE_CONTEXT *pSSLCipherSuiteCtx
);

// *****************************************************************************
// *****************************************************************************
// Section: WINC Driver TLS/SSL Routines
// *****************************************************************************
// *****************************************************************************

//*******************************************************************************
/*
  Function:
    WDRV_WINC_STATUS WDRV_WINC_SSLCTXDefault
    (
        WDRV_WINC_CIPHER_SUITE_CONTEXT *pSSLCipherSuiteCtx
    )

  Summary:
    Initialize an SSL cipher suite context.

  Description:
    Sets the default values for the cipher suite context.

  Precondition:
    None.

  Parameters:
    pSSLCipherSuiteCtx - Pointer to cipher suite context.

  Returns:
    WDRV_WINC_STATUS_OK          - The operation was performed.
    WDRV_WINC_STATUS_INVALID_ARG - The parameters were incorrect.

  Remarks:
    None.

*/

WDRV_WINC_STATUS WDRV_WINC_SSLCTXDefault
(
    WDRV_WINC_CIPHER_SUITE_CONTEXT *pSSLCipherSuiteCtx
);

//*******************************************************************************
/*
  Function:
    WDRV_WINC_STATUS WDRV_WINC_SSLCTXCipherSuitesSet
    (
        WDRV_WINC_CIPHER_SUITE_CONTEXT *pSSLCipherSuiteCtx,
        uint16_t *pCipherSuiteList,
        uint8_t numCipherSuites
    )

  Summary:
    Set the cipher suites enabled in a context.

  Description:
    Sets the list of enabled cipher suites within a cipher suite context using
      IANA defined IDs.

  Precondition:
    None.

  Parameters:
    pSSLCipherSuiteCtx  - Pointer to cipher suite context.
    pCipherSuiteList    - Pointer to list of cipher suites to enable.
    numCipherSuites     - Number of cipher suites to enable.

  Returns:
    WDRV_WINC_STATUS_OK          - The operation was performed.
    WDRV_WINC_STATUS_INVALID_ARG - The parameters were incorrect.

  Remarks:
    None.

*/

WDRV_WINC_STATUS WDRV_WINC_SSLCTXCipherSuitesSet
(
    WDRV_WINC_CIPHER_SUITE_CONTEXT *pSSLCipherSuiteCtx,
    uint16_t *pCipherSuiteList,
    uint8_t numCipherSuites
);

//*******************************************************************************
/*
  Function:
    uint8_t WDRV_WINC_SSLCTXCipherSuitesGet
    (
        WDRV_WINC_CIPHER_SUITE_CONTEXT *pSSLCipherSuiteCtx,
        uint16_t *pCipherSuiteList,
        uint8_t maxNumCipherSuites
    )

  Summary:
    Returns the enabled cipher suites from a context.

  Description:
    Gets the list of cipher suites from a context as a list of IANA IDs

  Precondition:
    None.

  Parameters:
    pSSLCipherSuiteCtx  - Pointer to cipher suite context.
    pCipherSuiteList    - Pointer to list of cipher suites to populate.
    maxNumCipherSuites  - Maximum number of cipher suites to populate in list.

  Returns:
    WDRV_WINC_STATUS_OK          - The operation was performed.
    WDRV_WINC_STATUS_INVALID_ARG - The parameters were incorrect.

  Remarks:
    None.

*/

uint8_t WDRV_WINC_SSLCTXCipherSuitesGet
(
    WDRV_WINC_CIPHER_SUITE_CONTEXT *pSSLCipherSuiteCtx,
    uint16_t *pCipherSuiteList,
    uint8_t maxNumCipherSuites
);

//*******************************************************************************
/*
  Function:
    WDRV_WINC_STATUS WDRV_WINC_SSLActiveCipherSuitesSet
    (
        DRV_HANDLE handle,
        WDRV_WINC_CIPHER_SUITE_CONTEXT *pSSLCipherSuiteCtx,
        WDRV_WINC_SSL_CIPHERSUITELIST_CALLBACK pfSSLListCallback
    )

  Summary:
    Set the active cipher suites.

  Description:
    Passes the active cipher suite list to the WINC.

  Precondition:
    WDRV_WINC_Initialize should have been called.
    WDRV_WINC_Open should have been called to obtain a valid handle.

  Parameters:
    handle             - Client handle obtained by a call to WDRV_WINC_Open.
    pSSLCipherSuiteCtx - Pointer to cipher suite context.
    pfSSLListCallback  - Pointer to callback function to receive updated list of
                           cipher suites.

  Returns:
    WDRV_WINC_STATUS_OK             - The operation was performed.
    WDRV_WINC_STATUS_NOT_OPEN       - The driver instance is not open.
    WDRV_WINC_STATUS_INVALID_ARG    - The parameters were incorrect.
    WDRV_WINC_STATUS_REQUEST_ERROR  - The request to the WINC was rejected.

  Remarks:
    None.

*/

WDRV_WINC_STATUS WDRV_WINC_SSLActiveCipherSuitesSet
(
    DRV_HANDLE handle,
    WDRV_WINC_CIPHER_SUITE_CONTEXT *pSSLCipherSuiteCtx,
    WDRV_WINC_SSL_CIPHERSUITELIST_CALLBACK pfSSLListCallback
);

#endif /* _WDRV_WINC_SSL_H */
