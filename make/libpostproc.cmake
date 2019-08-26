cmake_minimum_required(VERSION 3.15)

###########################################################
# Set Output Targets
add_library("postproc")

###########################################################
# Options (Configure)

###########################################################
# Target Settings

## postproc -----------------------------------------------
set(SourceDir "${SourceDirRoot}/libpostproc")
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDir}/libpostproc.v"
    "${SourceDir}/postprocess.c"
    "${SourceDir}/postprocess.h"
    # "${SourceDir}/postprocess_altivec_template.c"
    "${SourceDir}/postprocess_internal.h"
    # "${SourceDir}/postprocess_template.c"
    "${SourceDir}/postprocres.rc"
    "${SourceDir}/version.h"
)

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
target_sources("postproc" PRIVATE ${SourceFiles})
target_include_directories("postproc" PRIVATE ${HeaderDirs})
target_compile_options("postproc" PRIVATE
    ${CommonCompileOptions}
    ${GccCommonOptionsFile}
)
