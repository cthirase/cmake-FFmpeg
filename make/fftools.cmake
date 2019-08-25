cmake_minimum_required(VERSION 3.15)

###########################################################
# Set Output Targets
add_library("fftools")

###########################################################
# Options (Configure)

###########################################################
# Target Settings

## swscale ------------------------------------------------
set(SourceDir "${SourceDirRoot}/fftools")
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDir}/cmdutils.c"
    "${SourceDir}/cmdutils.h"
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
target_sources("fftools" PRIVATE ${SourceFiles})
target_include_directories("fftools" PRIVATE ${HeaderDirs})
target_compile_options("fftools" PRIVATE
    ${CommonCompileOptions}
)
