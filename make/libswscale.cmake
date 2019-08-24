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
if(AARCH64)
list(APPEND SourceFiles
    "${SourceDir}/aarch64"
)
endif()
if(ARM)
list(APPEND SourceFiles
    "${SourceDir}/arm"
)
endif()
if(X86)
list(APPEND SourceFiles
    "${SourceDir}/x86"
)
endif()

if(UNIX AND NOT APPLE)
list(APPEND SourceFiles
)
endif()
if(WIN32)
list(APPEND SourceFiles
)
endif()
if(APPLE)
list(APPEND SourceFiles
)
endif()
if(ANDROID)
list(APPEND SourceFiles
)
endif()

###########################################################
# Target Settings
target_sources("swscale" PRIVATE ${SourceFiles})
target_include_directories("swscale" PRIVATE ${HeaderDirs})
target_compile_options("swscale" PRIVATE
    ${CommonCompileOptions}
)
