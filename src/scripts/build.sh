#!/bin/bash

cd $1
rm -rd build 2>/dev/null
mkdir build && cd build
cmake ..
make
