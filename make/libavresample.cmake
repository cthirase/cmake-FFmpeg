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
target_sources("avresample" PRIVATE ${SourceFiles})
target_include_directories("avresample" PRIVATE ${HeaderDirs})
target_compile_options("avresample" PRIVATE
    ${CommonCompileOptions}
)
