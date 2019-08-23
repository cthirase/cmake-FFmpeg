#!/bin/python3
import os
import subprocess
import sys

try:
    import prompt_toolkit
except:
    print('The `prompt_toolkit` is not found.')
    print('see https://pypi.org/project/prompt_toolkit/')
    sys.exit(1)

def on_error():
    sys.exit(1) 

def sync_ffmpeg(script_dir):
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
    return

if __name__=='__main__':
    script_dir = os.path.dirname(os.path.abspath(__file__))
    sync_ffmpeg(script_dir)

    from prompt_toolkit import prompt
    from prompt_toolkit.completion import WordCompleter
    targets = dict()
    targets['Unix Makefiles'] = 'gnumake'
    targets['NMake Makefiles'] = 'gnumake'
    targets['Visual Studio 14 2015'] = 'pc2015'
    targets['Visual Studio 15 2017'] = 'pc2017'
    targets['Visual Studio 16 2019'] = 'pc2019'
    targets['Xcode'] = 'xcode'


    generators = targets.keys()

    generator_name = prompt('Select Generator: ', completer=WordCompleter(generators))
    make_dir_short = os.path.join('make', targets[generator_name])
    make_dir = os.path.join(script_dir, make_dir_short)
    

    # CMake
    proc = subprocess.run(
        ['cmake', '-S', script_dir, '-B', make_dir, '-G', generator_name]
    )
    if proc.returncode != 0:
        on_error()
    proc = subprocess.run(
        ['cmake', '--build', make_dir]
    )
    if proc.returncode != 0:
        on_error()

