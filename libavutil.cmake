cmake_minimum_required(VERSION 3.15)

###########################################################
# Set Output Targets
add_library("avutil")

###########################################################
# Options (Configure)

###########################################################
# Target Settings

## avutil -------------------------------------------------
set(SourceDir "src/libavutil")
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDir}/adler32.c"
    "${SourceDir}/adler32.h"
    "${SourceDir}/aes_ctr.c"
    "${SourceDir}/aes_ctr.h"
)
target_sources("avutil" PRIVATE ${SourceFiles})
target_include_directories("avutil" PRIVATE ${HeaderDirs})
