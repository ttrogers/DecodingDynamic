# DecodingDynamic
Files for simulating dynamic semantic representations in a recurrent neural network

This directory contains files for conducting the neural network simulations described in Rogers et al., "A deep, distributed, and dynamic code for animacy in human anterior temporal cortex."

Simulations were conducted using the open-source Light Efficient Network Simulator, documented and available for download at: https://github.com/crcox/lens

SUBDIRECTORIES:

ModelWeights contains trained model weights for deep-network data reported in the paper

ModelOutputs contains raw data output files for all simulations reported in the paper

RCode contains R scripts for analyzing the model data. Each script is briefly documented by comments in the file.

Files:

*.in: These are tcl scripts that build the corresponding network architecture and load training/testing examples. For instance deep_train_p9_e0.in builds the deep network architecture for training the model, while deep_test_p9_e0.in builds the deep network and prepares it for testing the model.

ecog_train_p9_e0.ex: Example patterns for training the network. 

ecog_train_p9_e0_8int.ex:  Example patterns used for testing the network. The only difference from training patterns is that the model is allowed to cycle for a longer period of time, allowing us to see how unit activations
change over a longer period of time.

train5.tcl: A TCL script that trains the deep network 5 times, saves the learned weights for each, and tests the trained model, saving hidden unit activations for all patterns at each timepoint.

test5.tcl: A TCL script that tests 5 trained models, loading the learned weights, processing the input patterns for 8 intervals (32 updates), and saving the hidden unit activations for each pattern at every update.

mr_procs.tcl: A TCL script defining procedures for writing unit activations over time in an easily-readable format.
