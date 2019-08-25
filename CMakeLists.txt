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
add_executable("ffprobe")
if(FFPLAY)
add_executable("ffplay")
endif()

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
set(CMAKE_C_FLAGS "-std=c11 @${MakeDirRoot}/gcc_common.opt")
set(CMAKE_CXX_FLAGS "-std=c++11 @${MakeDirRoot}/gcc_common.opt")
set(CMAKE_ASM_NASM_FLAGS "-Pconfig.asm")

set(HeaderDirs ${CMAKE_CURRENT_SOURCE_DIR})
list(APPEND HeaderDirs
    "${AutoGenDirRoot}"
    "${SourceDirRoot}"
)
set(CommonCompileOptions)
list(APPEND CommonCompileOptions
    "-DHAVE_AV_CONFIG_H"
)

## Common -------------------------------------------------
include("${MakeDirRoot}/libavcodec.cmake")
include("${MakeDirRoot}/libavdevice.cmake")
include("${MakeDirRoot}/libavfilter.cmake")
include("${MakeDirRoot}/libavformat.cmake")
include("${MakeDirRoot}/libavresample.cmake")
include("${MakeDirRoot}/libavutil.cmake")
include("${MakeDirRoot}/libpostproc.cmake")
include("${MakeDirRoot}/libswresample.cmake")
include("${MakeDirRoot}/libswscale.cmake")
include("${MakeDirRoot}/fftools.cmake")
set(SubLibraries
    "avcodec" "avdevice" "avfilter"
    "avformat" "avresample" "avutil"
    "postproc" "swresample" "swscale"
    "fftools"
)

## Apple Frameworks ---------------------------------------
set(AppleFrameworks
    "-framework AppKit"
    "-framework AudioToolbox"
    "-framework AVFoundation"
    "-framework CoreFoundation"
    "-framework CoreGraphics"
    "-framework CoreImage"
    "-framework CoreMedia"
    "-framework CoreServices"
    "-framework CoreVideo"
    "-framework Foundation"
    "-framework OpenGL"
    "-framework OpenGL"
    "-framework Security"
    "-framework VideoToolbox"
)

## FFmpeg -------------------------------------------------
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDirRoot}/fftools/ffmpeg.c"
    "${SourceDirRoot}/fftools/ffmpeg.h"
    # ffmpeg_cuvid.c
    # ffmpeg_filter.c
    # ffmpeg_hw.c
    # ffmpeg_opt.c
    # ffmpeg_qsv.c
    # ffmpeg_videotoolbox.c
)
target_sources("ffmpeg" PRIVATE ${SourceFiles})
target_include_directories("ffmpeg" PRIVATE ${HeaderDirs})
target_link_libraries("ffmpeg" ${SubLibraries})
if(APPLE)
target_link_libraries("ffmpeg" ${AppleFrameworks})
endif()

## FFplay -------------------------------------------------
if(FFPLAY)
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDirRoot}/fftools/ffplay.c"
)
target_sources("ffplay" PRIVATE ${SourceFiles})
target_include_directories("ffplay" PRIVATE ${HeaderDirs})
target_link_libraries("ffplay" ${SubLibraries})
if(APPLE)
target_link_libraries("ffplay" ${AppleFrameworks})
endif()
endif() # FFPLAY

## FFprobe -------------------------------------------------
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDirRoot}/fftools/ffprobe.c"
)
target_sources("ffprobe" PRIVATE ${SourceFiles})
target_include_directories("ffprobe" PRIVATE ${HeaderDirs})
target_link_libraries("ffprobe" ${SubLibraries})
if(APPLE)
target_link_libraries("ffprobe" ${AppleFrameworks})
endif()
