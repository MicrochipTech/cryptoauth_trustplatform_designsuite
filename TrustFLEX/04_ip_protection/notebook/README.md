# Collection of Examples for TrustFLEX device

## Objective
TrustFLEX device comes with pre-programmed configuration and options to reload few data slots with user specific secrets.

This folder contains ipprotection usecase example in Notebook(Python).

## Prerequisites
   - Refer to parent folder README.md files for tools, installations, sequences and hardware etc..,
   - Load the assets into secure element using TFLXTLS_resource_generation/TFLXTLS Resource Generator.ipynb

## Package
 - IP Protection with TFLXTLS_IP_protection.ipynb
This is a Jupyter notebook to demonstrate how IP protection can be achieved through challenge-response mode using MAC command

 - Supporting
.py and /img files in the folder are support scripts and images  used in the Jupyter notebook

## Getting Started
The notebook provided here performs various step involved in challenge-response verification using MAC command. This uses TFLXTLS_resource_generation/slot_5_secret_key.pem as the secret while performing verification operation.

Follow below steps,
1. Connect Crypto Trust Platform to PC/Laptop
2. Open Jupyter notebook from Anaconda navigator
3. Navigate to IP Protection notebook and open
4. Above step should open a browsing window with IP protection notebook
5. Use the Kernel-->'Restart & Run All' button to execute all the cells in the sequence

At the end of these steps, should see 'Verify MAC' button on the bottom of the page. Click that button to see the result. When the Secure element with correct secret is attached, authentication success message should be printed.