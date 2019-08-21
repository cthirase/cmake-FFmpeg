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
set(SourceDirRoot "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(AutoGenDirRoot "${CMAKE_CURRENT_SOURCE_DIR}/gen")
set(MakeDirRoot "${CMAKE_CURRENT_SOURCE_DIR}/make")

set(HeaderDirs ${CMAKE_CURRENT_SOURCE_DIR})
list(APPEND HeaderDirs
    "${AutoGenDirRoot}"
    "${SourceDirRoot}"
)
set(CommonCompileOptions)
list(APPEND CommonCompileOptions
    "-DHAVE_AV_CONFIG_H"
)
list(APPEND CommonCompileOptions "@${MakeDirRoot}/gcc_common.opt")

## Common -------------------------------------------------
include("${MakeDirRoot}/libavutil.cmake")
include("${MakeDirRoot}/libavformat.cmake")
set(SubLibraries "avutil" "avformat")

## FFmpeg -------------------------------------------------
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDirRoot}/fftools/ffmpeg.c"
    "${SourceDirRoot}/fftools/ffmpeg.h"
)
target_sources("ffmpeg" PRIVATE ${SourceFiles})
target_include_directories("ffmpeg" PRIVATE ${HeaderDirs})
target_link_libraries("ffmpeg" ${SubLibraries})

## FFplay -------------------------------------------------
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDirRoot}/fftools/ffplay.c"
)
target_sources("ffplay" PRIVATE ${SourceFiles})
target_include_directories("ffplay" PRIVATE ${HeaderDirs})
target_link_libraries("ffplay" ${SubLibraries})

## FFprobe -------------------------------------------------
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDirRoot}/fftools/ffprobe.c"
)
target_sources("ffprobe" PRIVATE ${SourceFiles})
target_include_directories("ffprobe" PRIVATE ${HeaderDirs})
target_link_libraries("ffprobe" ${SubLibraries})
