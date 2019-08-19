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
    "${SourceDir}/aes_internal.h"
    "${SourceDir}/aes.c"
    "${SourceDir}/aes.h"
    "${SourceDir}/attributes.h"
    "${SourceDir}/audio_fifo.c"
    "${SourceDir}/audio_fifo.h"
    "${SourceDir}/avassert.h"
    "${SourceDir}/avsscanf.c"
    "${SourceDir}/avstring.h"
    "${SourceDir}/avutil.h"
    # "${SourceDir}/avutilres.rc"
    "${SourceDir}/base64.c"
    "${SourceDir}/base64.h"
    "${SourceDir}/blowfish.c"
    "${SourceDir}/blowfish.h"
    "${SourceDir}/bprint.c"
    "${SourceDir}/bprint.h"
    "${SourceDir}/bswap.h"
    "${SourceDir}/buffer_internal.h"
    "${SourceDir}/buffer.c"
    "${SourceDir}/buffer.h"
    "${SourceDir}/camellia.c"
    "${SourceDir}/camellia.h"
    "${SourceDir}/cast5.c"
    "${SourceDir}/cast5.h"
    "${SourceDir}/channel_layout.c"
    "${SourceDir}/channel_layout.h"
    "${SourceDir}/color_utils.c"
    "${SourceDir}/color_utils.h"
    "${SourceDir}/colorspace.h"
    "${SourceDir}/common.h"
    "${SourceDir}/cpu_internal.h"
    "${SourceDir}/cpu.c"
    "${SourceDir}/cpu.h"
    "${SourceDir}/crc.c"
    "${SourceDir}/crc.h"
    "${SourceDir}/cuda_check.h"
    "${SourceDir}/des.c"
    "${SourceDir}/des.h"
    "${SourceDir}/dict.c"
    "${SourceDir}/dict.h"
    "${SourceDir}/display.c"
    "${SourceDir}/display.h"
    "${SourceDir}/downmix_info.c"
    "${SourceDir}/downmix_info.h"
    "${SourceDir}/dynarray.h"
    "${SourceDir}/encryption_info.c"
    "${SourceDir}/encryption_info.h"
    "${SourceDir}/error.c"
    "${SourceDir}/error.h"
    "${SourceDir}/eval.c"
    "${SourceDir}/eval.h"
    "${SourceDir}/ffmath.h"
    "${SourceDir}/fifo.c"
    "${SourceDir}/fifo.h"
    "${SourceDir}/file.c"
    "${SourceDir}/file.h"
    "${SourceDir}/file_open.c"
    "${SourceDir}/fixed_dsp.c"
    "${SourceDir}/fixed_dsp.h"
    "${SourceDir}/float_dsp.c"
    "${SourceDir}/float_dsp.h"
    "${SourceDir}/frame.c"
    "${SourceDir}/frame.h"
    "${SourceDir}/hash.c"
    "${SourceDir}/hash.h"
    "${SourceDir}/hdr_dynamic_metadata.c"
    "${SourceDir}/hdr_dynamic_metadata.h"
    "${SourceDir}/hmac.c"
    "${SourceDir}/hmac.h"
    "${SourceDir}/hwcontext.c"
    "${SourceDir}/hwcontext.h"
    "${SourceDir}/hwcontext_internal.h"
    "${SourceDir}/imgutils.c"
    "${SourceDir}/imgutils.h"
    "${SourceDir}/imgutils_internal.h"
    "${SourceDir}/integer.c"
    "${SourceDir}/integer.h"
    "${SourceDir}/internal.h"
    "${SourceDir}/intfloat.h"
    "${SourceDir}/intmath.c"
    "${SourceDir}/intmath.h"
    "${SourceDir}/intreadwrite.h"
    "${SourceDir}/lfg.c"
    "${SourceDir}/lfg.h"
    "${SourceDir}/libavutil.v"
    "${SourceDir}/libm.h"
    "${SourceDir}/lls.c"
    "${SourceDir}/lls.h"
    "${SourceDir}/log.c"
    "${SourceDir}/log.h"
    "${SourceDir}/log2_tab.c"
    "${SourceDir}/lzo.c"
    "${SourceDir}/lzo.h"
    "${SourceDir}/macros.h"
    "${SourceDir}/mastering_display_metadata.c"
    "${SourceDir}/mastering_display_metadata.h"
    "${SourceDir}/mathematics.c"
    "${SourceDir}/mathematics.h"
    "${SourceDir}/md5.c"
    "${SourceDir}/md5.h"
    "${SourceDir}/mem.c"
    "${SourceDir}/mem.h"
    "${SourceDir}/mem_internal.h"
    "${SourceDir}/motion_vector.h"
    "${SourceDir}/murmur3.c"
    "${SourceDir}/murmur3.h"
    "${SourceDir}/opt.c"
    "${SourceDir}/opt.h"
    "${SourceDir}/parseutils.c"
    "${SourceDir}/parseutils.h"
    "${SourceDir}/pca.c"
    "${SourceDir}/pca.h"
    "${SourceDir}/pixdesc.c"
    "${SourceDir}/pixdesc.h"
    "${SourceDir}/pixelutils.c"
    "${SourceDir}/pixelutils.h"
    "${SourceDir}/pixfmt.h"
    "${SourceDir}/qsort.h"
    "${SourceDir}/random_seed.c"
    "${SourceDir}/random_seed.h"
    "${SourceDir}/rational.c"
    "${SourceDir}/rational.h"
    "${SourceDir}/rc4.c"
    "${SourceDir}/rc4.h"
    "${SourceDir}/replaygain.h"
    "${SourceDir}/reverse.c"
    "${SourceDir}/reverse.h"
    "${SourceDir}/ripemd.c"
    "${SourceDir}/ripemd.h"
    "${SourceDir}/samplefmt.c"
    "${SourceDir}/samplefmt.h"
    "${SourceDir}/sha.c"
    "${SourceDir}/sha.h"
    "${SourceDir}/sha512.c"
    "${SourceDir}/sha512.h"
    "${SourceDir}/slicethread.c"
    "${SourceDir}/slicethread.h"
    "${SourceDir}/softfloat.h"
    "${SourceDir}/softfloat_ieee754.h"
    "${SourceDir}/softfloat_tables.h"
    "${SourceDir}/spherical.c"
    "${SourceDir}/spherical.h"
    "${SourceDir}/stereo3d.c"
    "${SourceDir}/stereo3d.h"
    "${SourceDir}/tablegen.h"
    "${SourceDir}/tea.c"
    "${SourceDir}/tea.h"
    "${SourceDir}/thread.h"
    "${SourceDir}/threadmessage.c"
    "${SourceDir}/threadmessage.h"
    "${SourceDir}/time.c"
    "${SourceDir}/time.h"
    "${SourceDir}/time_internal.h"
    "${SourceDir}/timecode.c"
    "${SourceDir}/timecode.h"
    "${SourceDir}/timer.h"
    "${SourceDir}/timestamp.h"
    "${SourceDir}/tree.c"
    "${SourceDir}/tree.h"
    "${SourceDir}/twofish.c"
    "${SourceDir}/twofish.h"
    "${SourceDir}/tx.c"
    "${SourceDir}/tx.h"
    "${SourceDir}/tx_double.c"
    "${SourceDir}/tx_float.c"
    "${SourceDir}/tx_priv.h"
    # "${SourceDir}/tx_template.c"
    "${SourceDir}/utils.c"
    "${SourceDir}/version.h"
    "${SourceDir}/wchar_filename.h"
    "${SourceDir}/xga_font_data.c"
    "${SourceDir}/xga_font_data.h"
    "${SourceDir}/xtea.c"
    "${SourceDir}/xtea.h"
)

if(CUDA)
list(APPEND SourceFiles
    "${SourceDir}/hwcontext_cuda.c"
    "${SourceDir}/hwcontext_cuda.h"
    "${SourceDir}/hwcontext_cuda_internal.h"
)
endif()
if(DRM)
list(APPEND SourceFiles
    "${SourceDir}/hwcontext_drm.c"
    "${SourceDir}/hwcontext_drm.h"
)
endif()
if(ANDROID)
list(APPEND SourceFiles
    "${SourceDir}/hwcontext_mediacodec.c"
    "${SourceDir}/hwcontext_mediacodec.h"
)
endif()
if(OPENCL)
list(APPEND SourceFiles
    "${SourceDir}/hwcontext_opencl.c"
    "${SourceDir}/hwcontext_opencl.h"
)
endif()
if (QUICK_SYNC_VIDEO)
list(APPEND SourceFiles
    "${SourceDir}/hwcontext_qsv.c"
    "${SourceDir}/hwcontext_qsv.h"
)
endif()

if(UNIX AND NOT APPLE)
list(APPEND SourceFiles
    "${SourceDir}/hwcontext_vaapi.c"
    "${SourceDir}/hwcontext_vaapi.h"
    "${SourceDir}/hwcontext_vdpau.c"
    "${SourceDir}/hwcontext_vdpau.h"
)
endif()
if(WIN32)
list(APPEND SourceFiles
    "${SourceDir}/hwcontext_d3d11va.c"
    "${SourceDir}/hwcontext_d3d11va.h"
    "${SourceDir}/hwcontext_dxva2.c"
    "${SourceDir}/hwcontext_dxva2.h"
)
endif()
if(APPLE)
list(APPEND SourceFiles
    "${SourceDir}/hwcontext_videotoolbox.c"
    "${SourceDir}/hwcontext_videotoolbox.h"
)
endif()

target_sources("avutil" PRIVATE ${SourceFiles})
target_include_directories("avutil" PRIVATE ${HeaderDirs})
target_compile_options("avutil" PRIVATE
    ${CommonCompileOptions}
)
