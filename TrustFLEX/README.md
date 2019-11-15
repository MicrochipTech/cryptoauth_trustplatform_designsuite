# Collection of Tools and Examples for TrustFLEX device

## TrustPlatform Product Page
The Trust Platform for CryptoAuthentication™ is a combination of multiple elements to simplify the addition of security to any embedded design.
 - Microchip Weblink - [TrustPlatform](https://www.microchip.com/design-centers/security-ics/trust-platform)
 - GitHub Wiki link - [DesignSuite-Wiki](https://github.com/MicrochipTech/cryptoauth_trustplatform_designsuite/wiki/Welcome)

## Objective
This package provides required Documentation and Tools to accelerate the prototyping of the most common use cases.

## Package
 - **Docs**
This folder contains the pre-requisites and lab manual to get start with required installations and

 - **TFLXTLS_resource_generation**
 This folder contains jupyter notebook and associated helper files to generate various assets like Symmetric secrets, ECC key pairs and certificates etc..,

 - **TFLXTLS_Use_Cases**
 This folder contains C and Python examples to experience various usecase examples

 - **TNGTLS_Manifest_Generation**
 This folder contains notebook that assists in generating manifest file for TNG devices

 - **UsecaseConfigurator**
 This folder contains the html that assists in generating provisioning XML from user secrets

Start Here.html is the starting point to navigate through the details of Trust Platform for CryptoAuthentication devices. This provides details about Trust&GO, TrustFLEX and TrustCUSTOM family devices, training videos, methodology and Configurators for generating provisioning XML.

For ease of understanding follow the below sequence
1. Refer to Start Here.html to get highlevel information
2. Generate assets using TFLXTLS_resource_generation
3. Run the usecase examples provided in TFLXTLS_Use_Cases both in Notebook and Embedded projects


## Release Notes
 - 1.1.0
    - Added Google Cloud Connection Usecase
    - Updated Firmware Validation Usecase to use an application instead of example bin
    - Other minor edits to overall content

 - 1.0.1
    - Initial version of TrustPlatform DesignSuite

