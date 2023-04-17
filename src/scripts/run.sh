#!/bin/bash

#cd $1/build
#./$2

gnome-terminal -- bash -c "
cd $1 &&
rm -rd build 2>/dev/null &&
mkdir build && cd build &&
cmake .. &&
clear &&
make &&
clear &&
./$2;
echo &&
echo \"Press enter to continue...\" &&
read"
