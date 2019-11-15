# Collection of Tools and Assets to be used with TrustFLEX device

## Objective
TrustFLEX device comes with pre-programmed configuration and options to reload few data slots with user specific secrets. This folder contains scripts to assist user for generating assets i.e. Symmetric keys, ECC Key pairs and certificates.

## Prerequisites
Refer to parent folder README.md files for installations, sequence and hardware etc..,

## Package
 - TFLXTLS Resource Generator.ipynb
This is a Jupyter notebook to generate the required assets that fits in to TrustFLEX device. Part of this notebook it also provides option to generate custom PKI along with manifest file generation for the connected device.

 - Supporting files
.py files in the folder are support scripts used in the Jupyter notebook


Follow below steps to run this,
1. Connect Crypto Trust Platform to PC/Laptop
2. Open Jupyter notebook from Anaconda navigator
3. Navigate to TFLXTLS Resource Generator.ipynb notebook and open
4. Above step should open a browsing window with resource generation notebook
5. Use the Kernel-->'Restart & Run All' button to execute all the cells in the sequence

At the end of these steps, this folder should contain pem and .crt for various secrets and certificates. These files are intended to be used while experimenting the example.

