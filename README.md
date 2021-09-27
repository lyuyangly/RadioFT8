# FT8 library 

C implementation of FT8 protocol decoder and encoder, mostly intended for experimental use on microcontrollers.

The intent of this library is to foster experimentation with e.g. automated beacons. For example, FT8 supports free-text messages and raw telemetry data (71 bits).

The encoding process is relatively light on resources, and an Arduino should be perfectly capable of running this code.

The decoder is designed with memory and computing efficiency in mind, in order to be usable with a fast enough microcontroller. It is shown to be working on STM32F7 boards fast enough for real work, but the embedded application itself is beyond this repository. This repository provides an example decoder which can decode a 15-second WAV file on a desktop machine or SBC. The decoder needs to access the whole 15-second window in spectral magnitude representation (the window can be also shorter, and messages can have varying starting time within the window). The example decoder uses slightly less than 200 KB of RAM. 

Thanks Karlis Goba, YL3JG https://github.com/kgoba/ft8_lib

