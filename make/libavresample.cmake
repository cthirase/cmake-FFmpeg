cmake_minimum_required(VERSION 3.15)

###########################################################
# Set Output Targets
add_library("avresample")

###########################################################
# Options (Configure)

###########################################################
# Target Settings

## avresample ---------------------------------------------
set(SourceDir "${SourceDirRoot}/libavresample")
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDir}/audio_convert.c"
    "${SourceDir}/audio_convert.h"
    "${SourceDir}/audio_data.c"
    "${SourceDir}/audio_data.h"
    "${SourceDir}/audio_mix.c"
    "${SourceDir}/audio_mix.h"
    "${SourceDir}/audio_mix_matrix.c"
    "${SourceDir}/avresample.h"
    "${SourceDir}/avresampleres.rc"
    "${SourceDir}/dither.c"
    "${SourceDir}/dither.h"
    "${SourceDir}/internal.h"
    "${SourceDir}/libavresample.v"
    "${SourceDir}/options.c"
    "${SourceDir}/resample.c"
    "${SourceDir}/resample.h"
    # "${SourceDir}/resample_template.c"
    "${SourceDir}/utils.c"
    "${SourceDir}/version.h"
)

if(CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
list(APPEND SourceFiles
    "${SourceDir}/x86/audio_convert.asm"
    "${SourceDir}/x86/audio_convert_init.c"
    "${SourceDir}/x86/audio_mix.asm"
    "${SourceDir}/x86/audio_mix_init.c"
    "${SourceDir}/x86/dither.asm"
    "${SourceDir}/x86/dither_init.c"
    "${SourceDir}/x86/util.asm"
    "${SourceDir}/x86/w64xmmtest.c"
)
endif()

###########################################################
# Target Settings
target_sources("avresample" PRIVATE ${SourceFiles})
target_include_directories("avresample" PRIVATE ${HeaderDirs})
target_compile_options("avresample" PRIVATE
    $<$<COMPILE_LANGUAGE:ASM_NASM>:${CompileOptAsm}>
    $<$<COMPILE_LANGUAGE:C>:${CompileOptC}>
    $<$<COMPILE_LANGUAGE:CXX>:${CompileOptCxx}>
)
