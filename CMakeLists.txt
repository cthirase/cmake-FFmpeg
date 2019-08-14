cmake_minimum_required(VERSION 3.15)
project(cmake-FFmpeg
    VERSION 4.2
    DESCRIPTION ""
    HOMEPAGE_URL "https://github.com/cthirase/cmake-FFmpeg"
    LANGUAGES C CXX ASM_NASM
)

###########################################################
# Set Output Targets
add_executable("ffmpeg")
add_executable("ffplay")
add_executable("ffprobe")

###########################################################
# Options (Configure)
set(FFMPEG_VERSION 4.2)
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/gen/libavutil/ffversion.h.in"
    "${CMAKE_CURRENT_SOURCE_DIR}/gen/libavutil/ffversion.h" @ONLY)

###########################################################
# Target Settings
## Common -------------------------------------------------
set(HeaderDirs ${CMAKE_CURRENT_SOURCE_DIR})
list(APPEND HeaderDirs
    "${CMAKE_CURRENT_SOURCE_DIR}/gen"
    "${CMAKE_CURRENT_SOURCE_DIR}/src"
)

## Common -------------------------------------------------
include("libavutil.cmake")
set(SubLibraries
    "avutil"
)

## FFmpeg -------------------------------------------------
set(SourceFiles)
list(APPEND SourceFiles
    "src/fftools/ffmpeg.c"
    "src/fftools/ffmpeg.h"
)
target_sources("ffmpeg" PRIVATE ${SourceFiles})
target_include_directories("ffmpeg" PRIVATE ${HeaderDirs})
target_link_libraries("ffmpeg" ${SubLibraries})

## FFplay -------------------------------------------------
set(SourceFiles)
list(APPEND SourceFiles
    "src/fftools/ffplay.c"
)
target_sources("ffplay" PRIVATE ${SourceFiles})
target_include_directories("ffplay" PRIVATE ${HeaderDirs})
target_link_libraries("ffplay" ${SubLibraries})

## FFprobe -------------------------------------------------
set(SourceFiles)
list(APPEND SourceFiles
    "src/fftools/ffprobe.c"
)
target_sources("ffprobe" PRIVATE ${SourceFiles})
target_include_directories("ffprobe" PRIVATE ${HeaderDirs})
target_link_libraries("ffprobe" ${SubLibraries})
