cmake_minimum_required(VERSION 3.15)

###########################################################
# Set Output Targets
add_library("swscale")

###########################################################
# Options (Configure)

###########################################################
# Target Settings

## swscale ------------------------------------------------
set(SourceDir "${SourceDirRoot}/libswscale")
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDir}/alphablend.c"
    # "${SourceDir}/bayer_template.c"
    "${SourceDir}/gamma.c"
    "${SourceDir}/hscale.c"
    "${SourceDir}/hscale_fast_bilinear.c"
    "${SourceDir}/input.c"
    "${SourceDir}/libswscale.v"
    "${SourceDir}/log2_tab.c"
    "${SourceDir}/options.c"
    "${SourceDir}/output.c"
    "${SourceDir}/rgb2rgb.c"
    "${SourceDir}/rgb2rgb.h"
    # "${SourceDir}/rgb2rgb_template.c"
    "${SourceDir}/slice.c"
    "${SourceDir}/swscale.c"
    "${SourceDir}/swscale.h"
    "${SourceDir}/swscale_internal.h"
    "${SourceDir}/swscale_unscaled.c"
    "${SourceDir}/swscaleres.rc"
    "${SourceDir}/utils.c"
    "${SourceDir}/version.h"
    "${SourceDir}/vscale.c"
    "${SourceDir}/yuv2rgb.c"
)

if(CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
list(APPEND SourceFiles
    "${SourceDir}/x86/hscale_fast_bilinear_simd.c"
    "${SourceDir}/x86/input.asm"
    "${SourceDir}/x86/output.asm"
    "${SourceDir}/x86/rgb2rgb.c"
    # "${SourceDir}/x86/rgb2rgb_template.c"
    "${SourceDir}/x86/rgb_2_rgb.asm"
    "${SourceDir}/x86/scale.asm"
    "${SourceDir}/x86/swscale.c"
    # "${SourceDir}/x86/swscale_template.c"
    "${SourceDir}/x86/w64xmmtest.c"
    "${SourceDir}/x86/yuv2rgb.c"
    # "${SourceDir}/x86/yuv2rgb_template.c"
)
endif()


###########################################################
# Target Settings
target_sources("swscale" PRIVATE ${SourceFiles})
target_include_directories("swscale" PRIVATE ${HeaderDirs})
target_compile_options("swscale" PRIVATE
    $<$<COMPILE_LANGUAGE:ASM_NASM>:${CompileOptAsm}>
    $<$<COMPILE_LANGUAGE:C>:${CompileOptC}>
    $<$<COMPILE_LANGUAGE:CXX>:${CompileOptCxx}>
)
