# Collection of Examples for TrustFLEX device

## Objective
TrustFLEX device comes with pre-programmed configuration and options to reload few data slots with user specific secrets. This folder contains examples in C.

## Prerequisites
Refer to parent folder README.md files for installations, sequence and hardware etc..,

## Package

 - dependencies - Submodules and common files that are required for examples to work.
   - [cryptoAuthLib](https://github.com/MicrochipTech/cryptoauthlib)
   - [micro-ecc](https://github.com/kmackay/micro-ecc)
   - common - Files that are common for multiple examples
 - project - Folder that contains Embedded projects to run C examples
 - ipprotection - Usecase example to demonstrate steps for IP Protection
 - secureboot - Usecsae example to demonstrate steps for Secureboot


## Getting Started
 - Connect CryptoAuth Trust Platform USB board to PC/Laptop
 - Clone the Submodules in dependencies using --recursive option
 - Configure the project for your platform.
   - On embedded platforms
      - Open MPLAB project
         - project\TFLXTLS_example_SAMD21.X
      - Select the example to execute
         - For ipprotection - Exclude secureboot_verify.c and include ipprotection.c in current configuration
         - For secureboot - Include secureboot_verify.c and exclude ipprotection.c in current configuration
      - Build and Program to check the results

## Restore CryptoAuth Trust Platform USB To Factory Program
 - Connect 608A USB Dongle to PC/Laptop
- Open MPLAB project                project\CryptoAuth_Trust_Platform_Factory_Program.X
- Program to restore it to factory program.


