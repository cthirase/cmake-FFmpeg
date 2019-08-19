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
set(CommonCompileOptions)
list(APPEND CommonCompileOptions
    "-DHAVE_AV_CONFIG_H"
)
list(APPEND CommonCompileOptions
    "-std=c11"
    "-Werror=partial-availability"
    # "-fomit-frame-pointer"
    # "-fPIC"
    # "-pthread"
    # "-g"
    "-Wdeclaration-after-statement"
    "-Wall"
    "-Wdisabled-optimization"
    "-Wpointer-arith"
    "-Wredundant-decls"
    "-Wwrite-strings"
    "-Wtype-limits"
    "-Wundef"
    "-Wmissing-prototypes"
    # "-Wno-pointer-to-int-cast"
    "-Wstrict-prototypes"
    "-Wempty-body"
    # "-Wno-parentheses"
    # "-Wno-switch"
    # "-Wno-format-zero-length"
    # "-Wno-pointer-sign"
    # "-Wno-unused-const-variable"
    # "-Wno-char-subscripts"
    # "-O3"
    # "-fno-math-errno"
    # "-fno-signed-zeros"
    # "-mstack-alignment=16"
    # "-Qunused-arguments"
    "-Werror=implicit-function-declaration"
    "-Werror=missing-prototypes"
    "-Werror=return-type"
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
