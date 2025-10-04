Janix, an OS kernel with GNU GPL3, and that is open-source
---------------------------------------------------

|| (1) Foreword ||
Janix is basically based on i386(ia32, or x86-32) archictecture and a unix distribution.
And You can compile from source, distribute with kernel's codes(in root directory of this project), or download bootable image file.
This is made by a korean student, Yumin Jang.And This is just a hobby.
So, please don't be mad or angry with the codes' problems.

|| (2) Dependencies(current) ||
  1. qemu
  Ubuntu/debian
  sudo apt-get install qemu-system
  2. make
  3. nasm

|| (3) How to build ||
  1. run 'make' command to compile everything
  2. run 'make run' command to run it on qemu-system-i386
  3. run 'make clean' command to clean up compiled files
