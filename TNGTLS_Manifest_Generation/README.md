# Collection of Examples for TrustFLEX device

## Objective
TrustFLEX device comes with pre-programmed configuration and options to reload few data slots with user specific secrets.

This folder contains notebook to generate manifest file for the TNG device connected to Trust platform

## Prerequisites
- Refer to parent folder README.md files for tools, installations, sequences and hardware etc..,

## Package
 - TNGTLS Manifest File Generation.ipynb
This is a Jupyter notebook to generate manifest file for the connected TNG device

Follow below steps,
1. Connect Crypto Trust Platform to PC/Laptop
2. Open Jupyter notebook from Anaconda navigator
3. Navigate to TNGTLS Manifest File Generation.ipynb and open
4. Use the Kernel-->'Restart & Run All' button to execute all the cells in the sequence

At the end of these steps, should see manifest file generated for the connected device in TFLXTLS_resource_generation folder. The file contains device serial number as prefix
