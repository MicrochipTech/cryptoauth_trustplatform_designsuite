# Collection of Examples for TrustFLEX device

## Objective
TrustFLEX device comes with pre-programmed configuration and options to reload few data slots with user specific secrets.

This folder contains secureboot usecase example in Notebook(Python).

## Prerequisites
   - Refer to parent folder README.md files for tools, installations, sequences and hardware etc..,
   - Load the assets into secure element using TFLXTLS_resource_generation/Crypto Resource Generator.ipynb

## Package
 - Firmware Validation with ECC608A-TLFXTLS Tutorial.ipynb
This is a Jupyter notebook to demonstrate how firmware validation can be achieved through full store mode of Secureboot command

 - Supporting
.py and /img files in the folder are support scripts and images  used in the Jupyter notebook

## Getting Started
The notebook provided here performs various step involved in firmware validation using secureboot command. This uses
1. TFLXTLS_resource_generation/secureboot_test_app.bin as the example application to perform validation
2. TFLXTLS_resource_generation/slot_15_ecc_key_pair.pem as key pair for signature and verify operations.
3. This Notebook(Python) does the signing operation and stores the signature in TFLXTLS_resource_generation/secureboot_test_app_sign.bin file
*Note:* Secure element performs only verification operation.

Follow below steps,
1. Connect Crypto Trust Platform to PC/Laptop
2. Open Jupyter notebook from Anaconda navigator
3. Navigate to Firmware Validation with ECC608A-TFLXTLS Tutorial notebook and open
4. Above step should open a browsing window with Firmware validation notebook
4. Use the Kernel-->'Restart & Run All' button to execute all the cells in the sequence

At the end of these steps, should see 'SBoot Update' and 'SBoot Verify' button on the bottom of the page.
 - Click 'SBoot Update' to update digest/signature using Secureboot
 - Click 'SBoot Verify' to Verify using Secureboot