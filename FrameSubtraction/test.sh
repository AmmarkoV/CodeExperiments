#!/bin/bash

echo "We need Root for setting priority"
sudo echo "thanks"

echo "Running AVX binary"
sudo nice -n -20 ionice -c 1 -n 0  time -v ./SubtractionAVX


echo "Running Normal binary"
sudo nice -n -20 ionice -c 1 -n 0  time -v ./Subtraction
exit 0
