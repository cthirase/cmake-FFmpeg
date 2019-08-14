#!/bin/bash

function on_error() {
    exit 1
}

SCRIPT_DIR=$(cd $(dirname $0); pwd)
FFSRC_DIR=$SCRIPT_DIR/src

###########################################################
# Get FFmpeg sources from GitHub
if [ ! -d src ]; then
    # [1st time] Get sources
    git clone https://github.com/FFmpeg/FFmpeg.git $FFSRC_DIR || on_error
else
    # [Next time] Sync sources
    git -C $FFSRC_DIR pull || on_error
fi

###########################################################
# CMake
cmake -S . -B make/gnumake || on_error
cmake --build make/gnumake || on_error
