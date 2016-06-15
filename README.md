# CYBORG OS (Code Name: Genesis)
Toy Operating System written in C and x86 Assembly Language. It is only a bare bones Operating System at the moment with support for  multiboot through GNU GRUB bootloader. 

![Cyborg Genesis](https://raw.githubusercontent.com/abhilashkrishnan/cyborg/master/cyborg.png)

#Current Status

1. Implemented the bootstrap Assembly Code with multiboot support.
2. Bootstrap assembly code will invoke the kernel C function to launch the bare bones operating system.
3. Implemented very few C libraries.
4. Provided configuration file for GRUB bootloader.
5. Implemented Linker Script.
6. Print and Clear video memory.

#Screenshots

GNU GRUB Multiboot Loader

![Cyborg Genesis](https://raw.githubusercontent.com/abhilashkrishnan/cyborg/master/grub.png)

CYBORG OS running on QEMU

![Cyborg Genesis](https://raw.githubusercontent.com/abhilashkrishnan/cyborg/master/os.png)

#Immediate Goals

1. Implement Interrupt Service Routines.
2. Implement Keyboard Driver.
3. Implement Memory Management - Basic Paging.
4. Implement a Basic Shell.
5. Implement Basic File System.

