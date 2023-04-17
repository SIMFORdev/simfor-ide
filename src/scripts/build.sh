#!/bin/bash

gnome-terminal -- bash -c "
cd $1 &&
rm -rd build 2>/dev/null &&
mkdir build && cd build &&
cmake .. &&
clear &&
make &&
echo &&
echo \"Press enter to continue...\" &&
read"
