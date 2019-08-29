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
if(FFPROBE)
add_executable("ffprobe")
endif()
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
# set(CMAKE_C_FLAGS "-std=c11 @${MakeDirRoot}/gcc_common.opt")
# set(CMAKE_CXX_FLAGS "-std=c++11 @${MakeDirRoot}/gcc_common.opt")
# set(CMAKE_ASM_NASM_FLAGS "")
# message(STATUS "CMAKE_OSX_SYSROOT: ${CMAKE_OSX_SYSROOT}")
# set(CMAKE_OSX_SYSROOT "${CMAKE_OSX_SYSROOT}/")
# message(STATUS "CMAKE_OSX_SYSROOT: ${CMAKE_OSX_SYSROOT}")
#message(FATAL_ERROR "FINISHED")

if(NOT USE_NASM)
find_program (YASM_EXECUTABLE yasm)
set(CMAKE_ASM_NASM_COMPILER ${YASM_EXECUTABLE})
set(CMAKE_ASM_NASM_COMPILER_ID YASM)
endif()

set(HeaderDirs ${CMAKE_CURRENT_SOURCE_DIR})
list(APPEND HeaderDirs
    "${AutoGenDirRoot}"
    "${SourceDirRoot}"
)
set(CompileOptC)
list(APPEND CompileOptC
    "@${MakeDirRoot}/gcc_common.opt"
)
set(CompileOptCxx)
list(APPEND CompileOptCxx
    "@${MakeDirRoot}/gcc_common.opt"
)
set(CompileOptAsm)
list(APPEND CompileOptAsm
    "-Pconfig.asm"
    "-DPIC"
    "-DPREFIX"
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
if(APPLE)
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
set(CMAKE_FIND_FRAMEWORK LAST)
set(CMAKE_FIND_APPBUNDLE LAST)
endif()

## FFmpeg -------------------------------------------------
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDirRoot}/fftools/ffmpeg.c"
    "${SourceDirRoot}/fftools/ffmpeg.h"
    # "${SourceDirRoot}/fftools/ffmpeg_cuvid.c"
    "${SourceDirRoot}/fftools/ffmpeg_filter.c"
    "${SourceDirRoot}/fftools/ffmpeg_hw.c"
    "${SourceDirRoot}/fftools/ffmpeg_opt.c"
    # "${SourceDirRoot}/fftools/ffmpeg_qsv.c"
)
if(APPLE)
list(APPEND SourceFiles
    "${SourceDirRoot}/fftools/ffmpeg_videotoolbox.c"
)
endif()
target_sources("ffmpeg" PRIVATE ${SourceFiles} )
target_include_directories("ffmpeg" PRIVATE ${HeaderDirs})
target_link_libraries("ffmpeg" ${SubLibraries}
    "m" "bz2" "pthread" "m" "z" "iconv"
)
add_compile_options("ffmpeg" PRIVATE ${GccCommonOptionsFile})
target_compile_features("ffmpeg" PRIVATE c_std_11 cxx_std_11)
target_compile_options("ffmpeg" PRIVATE
    $<$<COMPILE_LANGUAGE:ASM_NASM>:${CompileOptAsm}>
    $<$<COMPILE_LANGUAGE:C>:${CompileOptC}>
    $<$<COMPILE_LANGUAGE:CXX>:${CompileOptCxx}>
)

# set(CMAKE_C_FLAGS "-std=c11 @${MakeDirRoot}/gcc_common.opt")
# set(CMAKE_CXX_FLAGS "-std=c++11 @${MakeDirRoot}/gcc_common.opt")
# set_property(TARGET "ffmpeg" PROPERTY C_STANDARD 11)
# set_property(TARGET "ffmpeg" PROPERTY CXX_STANDARD 11)
# target_compile_features("ffmpeg" PRIVATE cxx_std_11)
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} @${MakeDirRoot}/gcc_common.opt")
if(APPLE)
target_link_libraries("ffmpeg" ${AppleFrameworks})
set_target_properties("ffmpeg" PROPERTIES LINK_FLAGS "-Wl,-F/Library/Frameworks")
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
target_compile_options("ffplay" PRIVATE
    $<$<COMPILE_LANGUAGE:ASM_NASM>:${CompileOptAsm}>
    $<$<COMPILE_LANGUAGE:C>:${CompileOptC}>
    $<$<COMPILE_LANGUAGE:CXX>:${CompileOptCxx}>
)
if(APPLE)
target_link_libraries("ffplay" ${AppleFrameworks})
set_target_properties("ffplay" PROPERTIES LINK_FLAGS "-Wl,-F/Library/Frameworks")
endif()
endif() # FFPLAY

## FFprobe -------------------------------------------------
if(FFPROBE)
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDirRoot}/fftools/ffprobe.c"
)
target_sources("ffprobe" PRIVATE ${SourceFiles})
target_include_directories("ffprobe" PRIVATE ${HeaderDirs})
target_link_libraries("ffprobe" ${SubLibraries})
target_compile_options("ffprobe" PRIVATE
    $<$<COMPILE_LANGUAGE:ASM_NASM>:${CompileOptAsm}>
    $<$<COMPILE_LANGUAGE:C>:${CompileOptC}>
    $<$<COMPILE_LANGUAGE:CXX>:${CompileOptCxx}>
)
add_compile_options()
if(APPLE)
target_link_libraries("ffprobe" ${AppleFrameworks})
set_target_properties("ffprobe" PROPERTIES LINK_FLAGS "-Wl,-F/Library/Frameworks")
endif()
endif()
