#!/bin/python3
import argparse
import os
import subprocess
import sys

def on_error():
    sys.exit(1) 

try:
    import prompt_toolkit
    from prompt_toolkit import prompt
    from prompt_toolkit.completion import WordCompleter
except:
    print('The `prompt_toolkit` is not found.')
    print('see https://pypi.org/project/prompt_toolkit/')
    on_error()

class CmakeTaskParam:
    def __init__(self):
        self.script_dir = ''
        self.targets = dict()
        self.make_dir_short = ''
        self.make_dir = ''
        self.generator_name = ''
        self.opt = None
        pass
    def __repr__(self):
        return str(self.__dict__)

def sync_ffmpeg(cparam: CmakeTaskParam):
    ffsrc_dir = os.path.join(cparam.script_dir, 'src')
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
        return False

    return True

def cmake_gen(cparam: CmakeTaskParam):
    pg = ['cmake', '-S', cparam.script_dir, '-B', cparam.make_dir, '-G', cparam.generator_name]
    if cparam.opt.verbose:
        pg.append('--trace')

    proc = subprocess.run(pg)
    if proc.returncode != 0:
        return False

    return True

def cmake_build(cparam: CmakeTaskParam):
    pg = ['cmake', '--build', cparam.make_dir]
    if cparam.opt.verbose:
        pg.append('-v')

    proc = subprocess.run(pg)
    if proc.returncode != 0:
        return False
    return True

def cmake_gen_and_build(cparam: CmakeTaskParam):
    if not cmake_gen(cparam):
        return False
    if not cmake_build(cparam):
        return False
    return True

def all(cparam: CmakeTaskParam):
    if not sync_ffmpeg(cparam):
        return False
    if not cmake_gen_and_build(cparam):
        return False
    return True

def main():
    op = argparse.ArgumentParser()
    op.add_argument('-v', '--verbose', action='store_true', default=False,
        help='Display more informations.'
    )
    cparam = CmakeTaskParam()
    cparam.opt = op.parse_args()
    cparam.script_dir = os.path.dirname(os.path.abspath(__file__))
    cparam.targets['Unix Makefiles'] = 'gnumake'
    cparam.targets['NMake Makefiles'] = 'gnumake'
    cparam.targets['Visual Studio 14 2015'] = 'pc2015'
    cparam.targets['Visual Studio 15 2017'] = 'pc2017'
    cparam.targets['Visual Studio 16 2019'] = 'pc2019'
    cparam.targets['Xcode'] = 'xcode'
    cparam.generator_name = prompt('Select Generator: ', completer=WordCompleter(cparam.targets.keys()))
    if cparam.generator_name not in cparam.targets:
        print('The specified generator is not found.')
        print(cparam.targets)
        on_error()

    cparam.make_dir_short = os.path.join('make', cparam.targets[cparam.generator_name])
    cparam.make_dir = os.path.join(cparam.script_dir, cparam.make_dir_short)

    tasks = dict()
    tasks['all']               = all
    tasks['sync ffmpeg']       = sync_ffmpeg
    tasks['cmake gen & build'] = cmake_gen_and_build
    tasks['cmake gen']         = cmake_gen
    tasks['cmake build']       = cmake_build

    task_name = prompt('Select Tasks: ', completer=WordCompleter(tasks.keys()))
    if task_name in tasks:
        tasks[task_name](cparam)
    else:
        print('The specified task is not found.')
        print(tasks)
        on_error()

if __name__=='__main__':
    try:
        main()
    except KeyboardInterrupt:
        pass
