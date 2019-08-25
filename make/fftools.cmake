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

###########################################################
# Target Settings
target_sources("fftools" PRIVATE ${SourceFiles})
target_include_directories("fftools" PRIVATE ${HeaderDirs})
target_compile_options("fftools" PRIVATE
    ${CommonCompileOptions}
)
