cmake_minimum_required(VERSION 3.15)

###########################################################
# Set Output Targets
add_library("avdevice")

###########################################################
# Options (Configure)

###########################################################
# Target Settings

## avdevice -----------------------------------------------
set(SourceDir "${SourceDirRoot}/libavdevice")
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDir}/alldevices.c"
    "${SourceDir}/avdevice.c"
    "${SourceDir}/avdevice.h"
    "${SourceDir}/avdeviceres.rc"
    "${SourceDir}/avfoundation.m"
    # "${SourceDir}/bktr.c"
    # "${SourceDir}/caca.c"

    # Black Magic : DeckLink
    # "${SourceDir}/decklink_common.cpp"
    # "${SourceDir}/decklink_common.h"
    # "${SourceDir}/decklink_common_c.h"
    # "${SourceDir}/decklink_dec.cpp"
    # "${SourceDir}/decklink_dec.h"
    # "${SourceDir}/decklink_dec_c.c"
    # "${SourceDir}/decklink_enc.cpp"
    # "${SourceDir}/decklink_enc.h"
    # "${SourceDir}/decklink_enc_c.c"

    # "${SourceDir}/fbdev_common.c"
    # "${SourceDir}/fbdev_common.h"
    # "${SourceDir}/fbdev_dec.c"
    # "${SourceDir}/fbdev_enc.c"

    "${SourceDir}/file_open.c"

    # IEC 61883 Consumer Audio/Video Equipment - Digital Interface
    # "${SourceDir}/iec61883.c"
    "${SourceDir}/internal.h"
    # "${SourceDir}/jack.c"
    # "${SourceDir}/kmsgrab.c"
    "${SourceDir}/lavfi.c"
    "${SourceDir}/libavdevice.v"
    # "${SourceDir}/libcdio.c"
    # "${SourceDir}/libdc1394.c"
    # "${SourceDir}/openal-dec.c"
    # "${SourceDir}/opengl_enc.c"
    # "${SourceDir}/opengl_enc_shaders.h"
    # "${SourceDir}/oss.c"
    "${SourceDir}/oss.h"
    # "${SourceDir}/oss_dec.c"
    # "${SourceDir}/oss_enc.c"
    # "${SourceDir}/pulse_audio_common.c"
    # "${SourceDir}/pulse_audio_common.h"
    # "${SourceDir}/pulse_audio_dec.c"
    # "${SourceDir}/pulse_audio_enc.c"
    "${SourceDir}/reverse.c"
    # "${SourceDir}/sdl2.c"
    # "${SourceDir}/sndio.c"
    # "${SourceDir}/sndio.h"
    # "${SourceDir}/sndio_dec.c"
    # "${SourceDir}/sndio_enc.c"
    "${SourceDir}/timefilter.c"
    "${SourceDir}/timefilter.h"
    "${SourceDir}/utils.c"
    # "${SourceDir}/v4l2-common.c"
    # "${SourceDir}/v4l2-common.h"
    # "${SourceDir}/v4l2.c"
    # "${SourceDir}/v4l2enc.c"
    "${SourceDir}/version.h"
    # "${SourceDir}/xcbgrab.c"
    # "${SourceDir}/xv.c"
)

if(UNIX AND NOT APPLE)
list(APPEND SourceFiles
    "${SourceDir}/alsa.c"
    "${SourceDir}/alsa.h"
    "${SourceDir}/alsa_dec.c"
    "${SourceDir}/alsa_enc.c"
)
endif()
if(ANDROID)
list(APPEND SourceFiles
    "${SourceDir}/android_camera.c"
)
endif()
if(WIN32)
list(APPEND SourceFiles
    "${SourceDir}/dshow.c"
    "${SourceDir}/dshow_capture.h"
    "${SourceDir}/dshow_common.c"
    "${SourceDir}/dshow_crossbar.c"
    "${SourceDir}/dshow_enummediatypes.c"
    "${SourceDir}/dshow_enumpins.c"
    "${SourceDir}/dshow_filter.c"
    "${SourceDir}/dshow_pin.c"
    "${SourceDir}/gdigrab.c"
    "${SourceDir}/vfwcap.c"
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
target_sources("avdevice" PRIVATE ${SourceFiles})
target_include_directories("avdevice" PRIVATE ${HeaderDirs})
target_compile_options("avdevice" PRIVATE
    $<$<COMPILE_LANGUAGE:ASM_NASM>:${CompileOptAsm}>
    $<$<COMPILE_LANGUAGE:C>:${CompileOptC}>
    $<$<COMPILE_LANGUAGE:CXX>:${CompileOptCxx}>
)
