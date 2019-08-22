#!/bin/python3
import os
import subprocess
import sys

def on_error():
    sys.exit(1) 

if __name__=='__main__':
    script_dir = os.path.dirname(os.path.abspath(__file__))
    ffsrc_dir = os.path.join(script_dir, 'src')
    ffsrcgit_dir = os.path.join(ffsrc_dir, '.git')

    # Get FFmpeg sources from GitHub
    if not os.path.exists(ffsrcgit_dir):
        proc = subprocess.run(
            ['git', 'clone', 'https://github.com/FFmpeg/FFmpeg.git', ffsrc_dir]
        )
    else:
        proc = subprocess.run(
            ['git', '-C', ffsrc_dir, 'pull']
        )
    if proc.returncode != 0:
        on_error()

    # CMake
    proc = subprocess.run(
        ['cmake', '-S', script_dir, '-B', 'make/gnumake']
    )
    if proc.returncode != 0:
        on_error()
    proc = subprocess.run(
        ['cmake', '--build', 'make/gnumake']
    )
    if proc.returncode != 0:
        on_error()

