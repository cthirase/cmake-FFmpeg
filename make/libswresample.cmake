cmake_minimum_required(VERSION 3.15)

###########################################################
# Set Output Targets
add_library("swresample")

###########################################################
# Options (Configure)

###########################################################
# Target Settings

## swresample ---------------------------------------------
set(SourceDir "${SourceDirRoot}/libswresample")
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDir}/audioconvert.c"
    "${SourceDir}/audioconvert.h"
    "${SourceDir}/dither.c"
    # "${SourceDir}/dither_template.c"
    "${SourceDir}/libswresample.v"
    "${SourceDir}/log2_tab.c"
    # "${SourceDir}/noise_shaping_data.c"
    "${SourceDir}/options.c"
    "${SourceDir}/rematrix.c"
    # "${SourceDir}/rematrix_template.c"
    "${SourceDir}/resample.c"
    "${SourceDir}/resample.h"
    "${SourceDir}/resample_dsp.c"
    # "${SourceDir}/resample_template.c"
    # "${SourceDir}/soxr_resample.c"
    "${SourceDir}/swresample.c"
    "${SourceDir}/swresample.h"
    "${SourceDir}/swresample_frame.c"
    "${SourceDir}/swresample_internal.h"
    "${SourceDir}/swresampleres.rc"
    "${SourceDir}/version.h"
)

if(CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
list(APPEND SourceFiles
    "${SourceDir}/x86/audio_convert.asm"
    "${SourceDir}/x86/audio_convert_init.c"
    "${SourceDir}/x86/rematrix.asm"
    "${SourceDir}/x86/rematrix_init.c"
    "${SourceDir}/x86/resample.asm"
    "${SourceDir}/x86/resample_init.c"
    "${SourceDir}/x86/w64xmmtest.c"
)
endif()

###########################################################
# Target Settings
target_sources("swresample" PRIVATE ${SourceFiles})
target_include_directories("swresample" PRIVATE ${HeaderDirs})
target_compile_options("swresample" PRIVATE
    $<$<COMPILE_LANGUAGE:ASM_NASM>:${CompileOptAsm}>
    $<$<COMPILE_LANGUAGE:C>:${CompileOptC}>
    $<$<COMPILE_LANGUAGE:CXX>:${CompileOptCxx}>
)
