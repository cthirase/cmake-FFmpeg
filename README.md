cmake-FFmpeg
=============

The goal is to build the [FFmpeg](https://github.com/FFmpeg/FFmpeg) with [CMake](https://cmake.org).

**This project is under-development.**
- [x] Make it buildable with CMake.
  - However, there are the following restrictions.
    - Only one configuration.
    - Only one platform. (macOS)
- [ ] Support some configurations via CMake `include` command.
  - [x] CC_IDENT
  - [x] FFMPEG_CONFIGURATION
  - [x] CONFIG_THIS_YEAR
  - [ ] (Other)
- [ ] Support some libraries.
  - [ ] libx264
  - [ ] libx265
  - [ ] libvpx
- [ ] Support Linux/Windows.


# 📃 Getting Started
- 🕐 Install the following tools.
    - [CMake](https://cmake.org/)
    - [Yasm](https://yasm.tortall.net)
    - [Git](https://git-scm.com)
    - [Python 3](https://www.python.org)
- 🕑 Clone && Change Directory
    - `git clone https://github.com/cthirase/cmake-FFmpeg.git`
    - `cd cmake-FFmpeg`
- 🕒 **[Linux/macOS only]** Grant execute permission.
    - `chmod +x build_all.sh`
- 🕓 Build
    - **[Linux/macOS]** `python3 build_all.py`
    - **[Windows]** `py build_all.bat` **(UNDERDEVELOPMENT)**

# Information
The `build_all` script download the following project sources.
- [FFmpeg](https://github.com/FFmpeg/FFmpeg)
    - `git clone `
- [LAME](http://lame.sourceforge.net/download.php)
    - Linux
        - `wget http://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz`
    - macOS
        - `curl -L http://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz -o lame-3.100.tar.gz`

# 📃 License
- See [LICENSE](LICENSE).

## FFmpeg
FFmpeg codebase is mainly LGPL-licensed with optional components licensed under GPL. Please refer to the LICENSE file for detailed information.
- See [FFmpeg/LICENSE](https://github.com/FFmpeg/FFmpeg/blob/master/LICENSE.md)

## CMake
CMake is distributed under the OSI-approved BSD 3-clause License.  Please see its Copyright.txt for details. The CMake source tree also contains some third-party components with compatible licenses.
- See [Licensing | CMake](https://cmake.org/licensing/)

## Yasm
Yasm is a complete rewrite of the NASM assembler under the “new” BSD License (some portions are under other licenses, see COPYING for details).
- See [Yasm](https://yasm.tortall.net)
