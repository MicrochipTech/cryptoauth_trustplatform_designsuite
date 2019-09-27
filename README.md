# Collection of Tools and Examples for TrustFLEX device

## Objective
TurstFlex device comes with pre-programmed configuration and options to reload few data slots with user specific secrets. This package provides required documentation, tools and various c,  python examples and scripts that assists user to generate secrets and experience the usecases.

## Prerequisites
 - Hardware
   - CryptoAuth Trust Platform Kit - DM320118
   - ATECC608A Trust Platform board - DT100104 (optional)
   - WIFI 7 CLICK (Optional)
 - Tools
   - [Anaconda](https://www.anaconda.com/) platform
   - [MPLAB](https://www.microchip.com/mplab/mplab-x-ide) with [XC32](https://www.microchip.com/mplab/compilers) and [ARM tool chain](https://www.microchip.com/mplab/avr-support/avr-and-arm-toolchains-c-compilers)
   - [AWS Client](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
   - Python modules like cryptoauthlib, cryptography etc..,
      - To install required modules use
      '''
         pip install -r requirements.txt
      '''
 - Refer to Training\TrustPlatform-DesignTool pre-requisites.pdf for details on the installation steps

## Package
 - **TFLXTLS_resource_generation**
 This folder contains jupyter notebook and associated helper files to generate various assets like Symmetric secrets, ECC key pairs and certificates etc..,

 - **TFLXTLS_Use_Cases**
 This folder contains C and Python examples to experience various usecase examples

 - **TNGTLS_Manifest_Generation**
 This folder contains notebook that assists in generating manifest file for TNG devices

 - **Training**
This folder contains the pre-requisites and lab manual to get start with required installations and

 - **UsecaseConfigurator**
 This folder contains the html that assists in generating provisioning XML from user secrets

Start Here.html is the starting point to navigate through the details of Trust Platform for CryptoAuthentication devices. This provides details about Trust&GO, TrustFLEX and TrustCUSTOM family devices, training videos, methodology and Configurators for generating provisioning XML

For ease of understanding follow the below sequence
1. Refer to Start Here.html to get highlevel information
2. Generate assets using TFLXTLS_resource_generation
3. Run the usecase examples provided in TFLXTLS_Use_Cases both in Notebook and MPLAB based projects

 Refer to individual folders README.md for further details.

## Release Notes
 - 0.9.5 version
  Updated Trust&GO embedded Wiki page
  Many html clean ups
 - 0.9.4 version
    - Complete revamp of the tool for Trust Platform
    - Multi device support is added... Can select the address and communicate with that device
    - Zero Touch AWS usecase is added... The Crypto Trust Platform along with Trust devices and WiFi 7 click can be used for connecting AWS
    - Generation of manifest file support added for Trust&GO and TrustFLEX
    - MCHP certificate backup and restore feature added
    - Fixed other minor suggestions and bugs

 - Initial versions
    - Supports only one device connection
    - Setup basic notebooks and C-examples for Secureboot and IP protection
