# Crux

Crux for the Acorn Electron. WIP.


Running Crux:
  So far Crux has been tested on
  - Clock Signal
  - Electrem
  - It has NOT been tested on real hardware or any emulators not mentioned here

Compiling Crux yourself
  - Crux is compiled with Beebasm. (https://github.com/stardot/beebasm)
  - Navigate to the folder with all the files and invoke Beebasm with 'beebasm.exe -i init.asm -do crux.ssd -boot game', or just run the make file in the directory
  - This will create a .ssd file that can be loaded into an emulator
