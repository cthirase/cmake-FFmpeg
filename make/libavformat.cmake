cmake_minimum_required(VERSION 3.15)

###########################################################
# Set Output Targets
add_library("avformat")

###########################################################
# Options (Configure)

###########################################################
# Target Settings

## avutil -------------------------------------------------
set(SourceDir "${SourceDirRoot}/libavformat")
set(SourceFiles)
list(APPEND SourceFiles
    "${SourceDir}/3dostr.c"
    "${SourceDir}/4xm.c"
    "${SourceDir}/Makefile"
    "${SourceDir}/a64.c"
    "${SourceDir}/aacdec.c"
    "${SourceDir}/aadec.c"
    "${SourceDir}/ac3dec.c"
    "${SourceDir}/acm.c"
    "${SourceDir}/act.c"
    "${SourceDir}/adp.c"
    "${SourceDir}/ads.c"
    "${SourceDir}/adtsenc.c"
    "${SourceDir}/adxdec.c"
    "${SourceDir}/aea.c"
    "${SourceDir}/afc.c"
    "${SourceDir}/aiff.h"
    "${SourceDir}/aiffdec.c"
    "${SourceDir}/aiffenc.c"
    "${SourceDir}/aixdec.c"
    "${SourceDir}/allformats.c"
    "${SourceDir}/amr.c"
    "${SourceDir}/anm.c"
    "${SourceDir}/apc.c"
    "${SourceDir}/ape.c"
    "${SourceDir}/apetag.c"
    "${SourceDir}/apetag.h"
    "${SourceDir}/apngdec.c"
    "${SourceDir}/apngenc.c"
    "${SourceDir}/aptxdec.c"
    "${SourceDir}/aqtitledec.c"
    "${SourceDir}/asf.c"
    "${SourceDir}/asf.h"
    "${SourceDir}/asfcrypt.c"
    "${SourceDir}/asfcrypt.h"
    "${SourceDir}/asfdec_f.c"
    "${SourceDir}/asfdec_o.c"
    "${SourceDir}/asfenc.c"
    "${SourceDir}/assdec.c"
    "${SourceDir}/assenc.c"
    "${SourceDir}/ast.c"
    "${SourceDir}/ast.h"
    "${SourceDir}/astdec.c"
    "${SourceDir}/astenc.c"
    "${SourceDir}/async.c"
    "${SourceDir}/au.c"
    "${SourceDir}/audiointerleave.c"
    "${SourceDir}/audiointerleave.h"
    "${SourceDir}/av1.c"
    "${SourceDir}/av1.h"
    "${SourceDir}/avc.c"
    "${SourceDir}/avc.h"
    "${SourceDir}/avformat.h"
    "${SourceDir}/avformatres.rc"
    "${SourceDir}/avi.h"
    "${SourceDir}/avidec.c"
    "${SourceDir}/avienc.c"
    "${SourceDir}/avio.c"
    "${SourceDir}/avio.h"
    "${SourceDir}/avio_internal.h"
    "${SourceDir}/aviobuf.c"
    "${SourceDir}/avisynth.c"
    "${SourceDir}/avlanguage.c"
    "${SourceDir}/avlanguage.h"
    "${SourceDir}/avr.c"
    "${SourceDir}/avs.c"
    "${SourceDir}/bethsoftvid.c"
    "${SourceDir}/bfi.c"
    "${SourceDir}/bink.c"
    "${SourceDir}/bintext.c"
    "${SourceDir}/bit.c"
    "${SourceDir}/bmv.c"
    "${SourceDir}/boadec.c"
    "${SourceDir}/brstm.c"
    "${SourceDir}/c93.c"
    "${SourceDir}/cache.c"
    "${SourceDir}/caf.c"
    "${SourceDir}/caf.h"
    "${SourceDir}/cafdec.c"
    "${SourceDir}/cafenc.c"
    "${SourceDir}/cavsvideodec.c"
    "${SourceDir}/cdg.c"
    "${SourceDir}/cdxl.c"
    "${SourceDir}/cinedec.c"
    "${SourceDir}/codec2.c"
    "${SourceDir}/concat.c"
    "${SourceDir}/concatdec.c"
    "${SourceDir}/crcenc.c"
    "${SourceDir}/crypto.c"
    "${SourceDir}/cutils.c"
    "${SourceDir}/dash.c"
    "${SourceDir}/dash.h"
    "${SourceDir}/dashenc.c"
    "${SourceDir}/data_uri.c"
    "${SourceDir}/dauddec.c"
    "${SourceDir}/daudenc.c"
    "${SourceDir}/davs2.c"
    "${SourceDir}/dcstr.c"
    "${SourceDir}/dfa.c"
    "${SourceDir}/dhav.c"
    "${SourceDir}/diracdec.c"
    "${SourceDir}/dnxhddec.c"
    "${SourceDir}/dsfdec.c"
    "${SourceDir}/dsicin.c"
    "${SourceDir}/dss.c"
    "${SourceDir}/dtsdec.c"
    "${SourceDir}/dtshddec.c"
    "${SourceDir}/dump.c"
    "${SourceDir}/dv.c"
    "${SourceDir}/dv.h"
    "${SourceDir}/dvbsub.c"
    "${SourceDir}/dvbtxt.c"
    "${SourceDir}/dvenc.c"
    "${SourceDir}/dxa.c"
    "${SourceDir}/eacdata.c"
    "${SourceDir}/electronicarts.c"
    "${SourceDir}/epafdec.c"
    "${SourceDir}/ffmeta.h"
    "${SourceDir}/ffmetadec.c"
    "${SourceDir}/ffmetaenc.c"
    "${SourceDir}/fifo.c"
    "${SourceDir}/fifo_test.c"
    "${SourceDir}/file.c"
    "${SourceDir}/file_open.c"
    "${SourceDir}/filmstripdec.c"
    "${SourceDir}/filmstripenc.c"
    "${SourceDir}/fitsdec.c"
    "${SourceDir}/fitsenc.c"
    "${SourceDir}/flac_picture.c"
    "${SourceDir}/flac_picture.h"
    "${SourceDir}/flacdec.c"
    "${SourceDir}/flacenc.c"
    "${SourceDir}/flacenc.h"
    "${SourceDir}/flacenc_header.c"
    "${SourceDir}/flic.c"
    "${SourceDir}/flv.h"
    "${SourceDir}/flvdec.c"
    "${SourceDir}/flvenc.c"
    "${SourceDir}/format.c"
    "${SourceDir}/framecrcenc.c"
    "${SourceDir}/framehash.c"
    "${SourceDir}/frmdec.c"
    "${SourceDir}/fsb.c"
    "${SourceDir}/ftp.c"
    "${SourceDir}/g722.c"
    "${SourceDir}/g723_1.c"
    "${SourceDir}/g726.c"
    "${SourceDir}/g729dec.c"
    "${SourceDir}/gdv.c"
    "${SourceDir}/genh.c"
    "${SourceDir}/gif.c"
    "${SourceDir}/gifdec.c"
    "${SourceDir}/golomb_tab.c"
    "${SourceDir}/gopher.c"
    "${SourceDir}/gsmdec.c"
    "${SourceDir}/gxf.c"
    "${SourceDir}/gxf.h"
    "${SourceDir}/gxfenc.c"
    "${SourceDir}/h261dec.c"
    "${SourceDir}/h263dec.c"
    "${SourceDir}/h264dec.c"
    "${SourceDir}/hashenc.c"
    "${SourceDir}/hcom.c"
    "${SourceDir}/hdsenc.c"
    "${SourceDir}/hevc.c"
    "${SourceDir}/hevc.h"
    "${SourceDir}/hevcdec.c"
    "${SourceDir}/hls.c"
    "${SourceDir}/hlsenc.c"
    "${SourceDir}/hlsplaylist.c"
    "${SourceDir}/hlsplaylist.h"
    "${SourceDir}/hlsproto.c"
    "${SourceDir}/hnm.c"
    "${SourceDir}/http.c"
    "${SourceDir}/http.h"
    "${SourceDir}/httpauth.c"
    "${SourceDir}/httpauth.h"
    "${SourceDir}/icecast.c"
    "${SourceDir}/icodec.c"
    "${SourceDir}/icoenc.c"
    "${SourceDir}/id3v1.c"
    "${SourceDir}/id3v1.h"
    "${SourceDir}/id3v2.c"
    "${SourceDir}/id3v2.h"
    "${SourceDir}/id3v2enc.c"
    "${SourceDir}/idcin.c"
    "${SourceDir}/idroqdec.c"
    "${SourceDir}/idroqenc.c"
    "${SourceDir}/iff.c"
    "${SourceDir}/ifv.c"
    "${SourceDir}/ilbc.c"
    "${SourceDir}/img2.c"
    "${SourceDir}/img2.h"
    "${SourceDir}/img2_alias_pix.c"
    "${SourceDir}/img2_brender_pix.c"
    "${SourceDir}/img2dec.c"
    "${SourceDir}/img2enc.c"
    "${SourceDir}/ingenientdec.c"
    "${SourceDir}/internal.h"
    "${SourceDir}/ip.c"
    "${SourceDir}/ip.h"
    "${SourceDir}/ipmovie.c"
    "${SourceDir}/ircam.c"
    "${SourceDir}/ircam.h"
    "${SourceDir}/ircamdec.c"
    "${SourceDir}/ircamenc.c"
    "${SourceDir}/isom.c"
    "${SourceDir}/isom.h"
    "${SourceDir}/iss.c"
    "${SourceDir}/iv8.c"
    "${SourceDir}/ivfdec.c"
    "${SourceDir}/ivfenc.c"
    "${SourceDir}/jacosubdec.c"
    "${SourceDir}/jacosubenc.c"
    "${SourceDir}/jvdec.c"
    "${SourceDir}/latmenc.c"
    "${SourceDir}/libavformat.v"
    "${SourceDir}/lmlm4.c"
    "${SourceDir}/loasdec.c"
    "${SourceDir}/log2_tab.c"
    "${SourceDir}/lrc.c"
    "${SourceDir}/lrc.h"
    "${SourceDir}/lrcdec.c"
    "${SourceDir}/lrcenc.c"
    "${SourceDir}/lvfdec.c"
    "${SourceDir}/lxfdec.c"
    "${SourceDir}/m4vdec.c"
    "${SourceDir}/matroska.c"
    "${SourceDir}/matroska.h"
    "${SourceDir}/matroskadec.c"
    "${SourceDir}/matroskaenc.c"
    "${SourceDir}/md5proto.c"
    "${SourceDir}/metadata.c"
    "${SourceDir}/metadata.h"
    "${SourceDir}/mgsts.c"
    "${SourceDir}/microdvddec.c"
    "${SourceDir}/microdvdenc.c"
    "${SourceDir}/mj2kdec.c"
    "${SourceDir}/mkvtimestamp_v2.c"
    "${SourceDir}/mlpdec.c"
    "${SourceDir}/mlvdec.c"
    "${SourceDir}/mm.c"
    "${SourceDir}/mmf.c"
    "${SourceDir}/mms.c"
    "${SourceDir}/mms.h"
    "${SourceDir}/mmsh.c"
    "${SourceDir}/mmst.c"
    "${SourceDir}/mov.c"
    "${SourceDir}/mov_chan.c"
    "${SourceDir}/mov_chan.h"
    "${SourceDir}/mov_esds.c"
    "${SourceDir}/movenc.c"
    "${SourceDir}/movenc.h"
    "${SourceDir}/movenccenc.c"
    "${SourceDir}/movenccenc.h"
    "${SourceDir}/movenchint.c"
    "${SourceDir}/mp3dec.c"
    "${SourceDir}/mp3enc.c"
    "${SourceDir}/mpc.c"
    "${SourceDir}/mpc8.c"
    "${SourceDir}/mpeg.c"
    "${SourceDir}/mpeg.h"
    "${SourceDir}/mpegenc.c"
    "${SourceDir}/mpegts.c"
    "${SourceDir}/mpegts.h"
    "${SourceDir}/mpegtsenc.c"
    "${SourceDir}/mpegvideodec.c"
    "${SourceDir}/mpjpeg.c"
    "${SourceDir}/mpjpegdec.c"
    "${SourceDir}/mpl2dec.c"
    "${SourceDir}/mpsubdec.c"
    "${SourceDir}/msf.c"
    "${SourceDir}/msnwc_tcp.c"
    "${SourceDir}/mtaf.c"
    "${SourceDir}/mtv.c"
    "${SourceDir}/musx.c"
    "${SourceDir}/mux.c"
    "${SourceDir}/mvdec.c"
    "${SourceDir}/mvi.c"
    "${SourceDir}/mxf.c"
    "${SourceDir}/mxf.h"
    "${SourceDir}/mxfdec.c"
    "${SourceDir}/mxfenc.c"
    "${SourceDir}/mxg.c"
    "${SourceDir}/ncdec.c"
    "${SourceDir}/network.c"
    "${SourceDir}/network.h"
    "${SourceDir}/nistspheredec.c"
    "${SourceDir}/nspdec.c"
    "${SourceDir}/nsvdec.c"
    "${SourceDir}/nullenc.c"
    "${SourceDir}/nut.c"
    "${SourceDir}/nut.h"
    "${SourceDir}/nutdec.c"
    "${SourceDir}/nutenc.c"
    "${SourceDir}/nuv.c"
    "${SourceDir}/oggdec.c"
    "${SourceDir}/oggdec.h"
    "${SourceDir}/oggenc.c"
    "${SourceDir}/oggparsecelt.c"
    "${SourceDir}/oggparsedaala.c"
    "${SourceDir}/oggparsedirac.c"
    "${SourceDir}/oggparseflac.c"
    "${SourceDir}/oggparseogm.c"
    "${SourceDir}/oggparseopus.c"
    "${SourceDir}/oggparseskeleton.c"
    "${SourceDir}/oggparsespeex.c"
    "${SourceDir}/oggparsetheora.c"
    "${SourceDir}/oggparsevorbis.c"
    "${SourceDir}/oggparsevp8.c"
    "${SourceDir}/oma.c"
    "${SourceDir}/oma.h"
    "${SourceDir}/omadec.c"
    "${SourceDir}/omaenc.c"
    "${SourceDir}/options.c"
    "${SourceDir}/options_table.h"
    "${SourceDir}/os_support.c"
    "${SourceDir}/os_support.h"
    "${SourceDir}/paf.c"
    "${SourceDir}/pcm.c"
    "${SourceDir}/pcm.h"
    "${SourceDir}/pcmdec.c"
    "${SourceDir}/pcmenc.c"
    "${SourceDir}/pjsdec.c"
    "${SourceDir}/pmpdec.c"
    "${SourceDir}/prompeg.c"
    "${SourceDir}/protocols.c"
    "${SourceDir}/psxstr.c"
    "${SourceDir}/pva.c"
    "${SourceDir}/pvfdec.c"
    "${SourceDir}/qcp.c"
    "${SourceDir}/qtpalette.c"
    "${SourceDir}/qtpalette.h"
    "${SourceDir}/r3d.c"
    "${SourceDir}/rawdec.c"
    "${SourceDir}/rawdec.h"
    "${SourceDir}/rawenc.c"
    "${SourceDir}/rawenc.h"
    "${SourceDir}/rawutils.c"
    "${SourceDir}/rawvideodec.c"
    "${SourceDir}/rdt.c"
    "${SourceDir}/rdt.h"
    "${SourceDir}/realtextdec.c"
    "${SourceDir}/redspark.c"
    "${SourceDir}/replaygain.c"
    "${SourceDir}/replaygain.h"
    "${SourceDir}/riff.c"
    "${SourceDir}/riff.h"
    "${SourceDir}/riffdec.c"
    "${SourceDir}/riffenc.c"
    "${SourceDir}/rl2.c"
    "${SourceDir}/rm.c"
    "${SourceDir}/rm.h"
    "${SourceDir}/rmdec.c"
    "${SourceDir}/rmenc.c"
    "${SourceDir}/rmsipr.c"
    "${SourceDir}/rmsipr.h"
    "${SourceDir}/rpl.c"
    "${SourceDir}/rsd.c"
    "${SourceDir}/rso.c"
    "${SourceDir}/rso.h"
    "${SourceDir}/rsodec.c"
    "${SourceDir}/rsoenc.c"
    "${SourceDir}/rtmp.h"
    "${SourceDir}/rtmpcrypt.c"
    "${SourceDir}/rtmpcrypt.h"
    "${SourceDir}/rtmpdh.c"
    "${SourceDir}/rtmpdh.h"
    "${SourceDir}/rtmpdigest.c"
    "${SourceDir}/rtmphttp.c"
    "${SourceDir}/rtmppkt.c"
    "${SourceDir}/rtmppkt.h"
    "${SourceDir}/rtmpproto.c"
    "${SourceDir}/rtp.c"
    "${SourceDir}/rtp.h"
    "${SourceDir}/rtpdec.c"
    "${SourceDir}/rtpdec.h"
    "${SourceDir}/rtpdec_ac3.c"
    "${SourceDir}/rtpdec_amr.c"
    "${SourceDir}/rtpdec_asf.c"
    "${SourceDir}/rtpdec_dv.c"
    "${SourceDir}/rtpdec_formats.h"
    "${SourceDir}/rtpdec_g726.c"
    "${SourceDir}/rtpdec_h261.c"
    "${SourceDir}/rtpdec_h263.c"
    "${SourceDir}/rtpdec_h263_rfc2190.c"
    "${SourceDir}/rtpdec_h264.c"
    "${SourceDir}/rtpdec_hevc.c"
    "${SourceDir}/rtpdec_ilbc.c"
    "${SourceDir}/rtpdec_jpeg.c"
    "${SourceDir}/rtpdec_latm.c"
    "${SourceDir}/rtpdec_mpa_robust.c"
    "${SourceDir}/rtpdec_mpeg12.c"
    "${SourceDir}/rtpdec_mpeg4.c"
    "${SourceDir}/rtpdec_mpegts.c"
    "${SourceDir}/rtpdec_qcelp.c"
    "${SourceDir}/rtpdec_qdm2.c"
    "${SourceDir}/rtpdec_qt.c"
    "${SourceDir}/rtpdec_rfc4175.c"
    "${SourceDir}/rtpdec_svq3.c"
    "${SourceDir}/rtpdec_vc2hq.c"
    "${SourceDir}/rtpdec_vp8.c"
    "${SourceDir}/rtpdec_vp9.c"
    "${SourceDir}/rtpdec_xiph.c"
    "${SourceDir}/rtpenc.c"
    "${SourceDir}/rtpenc.h"
    "${SourceDir}/rtpenc_aac.c"
    "${SourceDir}/rtpenc_amr.c"
    "${SourceDir}/rtpenc_chain.c"
    "${SourceDir}/rtpenc_chain.h"
    "${SourceDir}/rtpenc_h261.c"
    "${SourceDir}/rtpenc_h263.c"
    "${SourceDir}/rtpenc_h263_rfc2190.c"
    "${SourceDir}/rtpenc_h264_hevc.c"
    "${SourceDir}/rtpenc_jpeg.c"
    "${SourceDir}/rtpenc_latm.c"
    "${SourceDir}/rtpenc_mpegts.c"
    "${SourceDir}/rtpenc_mpv.c"
    "${SourceDir}/rtpenc_vc2hq.c"
    "${SourceDir}/rtpenc_vp8.c"
    "${SourceDir}/rtpenc_vp9.c"
    "${SourceDir}/rtpenc_xiph.c"
    "${SourceDir}/rtpproto.c"
    "${SourceDir}/rtpproto.h"
    "${SourceDir}/rtsp.c"
    "${SourceDir}/rtsp.h"
    "${SourceDir}/rtspcodes.h"
    "${SourceDir}/rtspdec.c"
    "${SourceDir}/rtspenc.c"
    "${SourceDir}/s337m.c"
    "${SourceDir}/samidec.c"
    "${SourceDir}/sapdec.c"
    "${SourceDir}/sapenc.c"
    "${SourceDir}/sauce.c"
    "${SourceDir}/sauce.h"
    "${SourceDir}/sbcdec.c"
    "${SourceDir}/sbgdec.c"
    "${SourceDir}/sccdec.c"
    "${SourceDir}/sccenc.c"
    "${SourceDir}/sctp.c"
    "${SourceDir}/sdp.c"
    "${SourceDir}/sdr2.c"
    "${SourceDir}/sdsdec.c"
    "${SourceDir}/sdxdec.c"
    "${SourceDir}/segafilm.c"
    "${SourceDir}/segafilmenc.c"
    "${SourceDir}/segment.c"
    "${SourceDir}/serdec.c"
    "${SourceDir}/shortendec.c"
    "${SourceDir}/sierravmd.c"
    "${SourceDir}/siff.c"
    "${SourceDir}/smacker.c"
    "${SourceDir}/smjpeg.c"
    "${SourceDir}/smjpeg.h"
    "${SourceDir}/smjpegdec.c"
    "${SourceDir}/smjpegenc.c"
    "${SourceDir}/smoothstreamingenc.c"
    "${SourceDir}/smush.c"
    "${SourceDir}/sol.c"
    "${SourceDir}/sox.h"
    "${SourceDir}/soxdec.c"
    "${SourceDir}/soxenc.c"
    "${SourceDir}/spdif.c"
    "${SourceDir}/spdif.h"
    "${SourceDir}/spdifdec.c"
    "${SourceDir}/spdifenc.c"
    "${SourceDir}/srtdec.c"
    "${SourceDir}/srtenc.c"
    "${SourceDir}/srtp.c"
    "${SourceDir}/srtp.h"
    "${SourceDir}/srtpproto.c"
    "${SourceDir}/stldec.c"
    "${SourceDir}/subfile.c"
    "${SourceDir}/subtitles.c"
    "${SourceDir}/subtitles.h"
    "${SourceDir}/subviewer1dec.c"
    "${SourceDir}/subviewerdec.c"
    "${SourceDir}/supdec.c"
    "${SourceDir}/supenc.c"
    "${SourceDir}/svag.c"
    "${SourceDir}/swf.c"
    "${SourceDir}/swf.h"
    "${SourceDir}/swfdec.c"
    "${SourceDir}/swfenc.c"
    "${SourceDir}/takdec.c"
    "${SourceDir}/tcp.c"
    "${SourceDir}/tedcaptionsdec.c"
    "${SourceDir}/tee.c"
    "${SourceDir}/tee_common.c"
    "${SourceDir}/tee_common.h"
    "${SourceDir}/teeproto.c"
    "${SourceDir}/tests"
    "${SourceDir}/thp.c"
    "${SourceDir}/tiertexseq.c"
    "${SourceDir}/tls.c"
    "${SourceDir}/tls.h"
    "${SourceDir}/tls_gnutls.c"
    "${SourceDir}/tls_libtls.c"
    "${SourceDir}/tls_mbedtls.c"
    "${SourceDir}/tls_openssl.c"
    "${SourceDir}/tls_schannel.c"
    "${SourceDir}/tls_securetransport.c"
    "${SourceDir}/tmv.c"
    "${SourceDir}/tta.c"
    "${SourceDir}/ttaenc.c"
    "${SourceDir}/tty.c"
    "${SourceDir}/txd.c"
    "${SourceDir}/ty.c"
    "${SourceDir}/udp.c"
    "${SourceDir}/uncodedframecrcenc.c"
    "${SourceDir}/unix.c"
    "${SourceDir}/url.c"
    "${SourceDir}/url.h"
    "${SourceDir}/urldecode.c"
    "${SourceDir}/urldecode.h"
    "${SourceDir}/utils.c"
    "${SourceDir}/v210.c"
    "${SourceDir}/vag.c"
    "${SourceDir}/vapoursynth.c"
    "${SourceDir}/vc1dec.c"
    "${SourceDir}/vc1test.c"
    "${SourceDir}/vc1testenc.c"
    "${SourceDir}/version.h"
    "${SourceDir}/vividas.c"
    "${SourceDir}/vivo.c"
    "${SourceDir}/voc.c"
    "${SourceDir}/voc.h"
    "${SourceDir}/voc_packet.c"
    "${SourceDir}/vocdec.c"
    "${SourceDir}/vocenc.c"
    "${SourceDir}/vorbiscomment.c"
    "${SourceDir}/vorbiscomment.h"
    "${SourceDir}/vpcc.c"
    "${SourceDir}/vpcc.h"
    "${SourceDir}/vpk.c"
    "${SourceDir}/vplayerdec.c"
    "${SourceDir}/vqf.c"
    "${SourceDir}/w64.c"
    "${SourceDir}/w64.h"
    "${SourceDir}/wavdec.c"
    "${SourceDir}/wavenc.c"
    "${SourceDir}/wc3movie.c"
    "${SourceDir}/webm_chunk.c"
    "${SourceDir}/webmdashenc.c"
    "${SourceDir}/webpenc.c"
    "${SourceDir}/webvttdec.c"
    "${SourceDir}/webvttenc.c"
    "${SourceDir}/westwood_aud.c"
    "${SourceDir}/westwood_vqa.c"
    "${SourceDir}/wsddec.c"
    "${SourceDir}/wtv.h"
    "${SourceDir}/wtv_common.c"
    "${SourceDir}/wtvdec.c"
    "${SourceDir}/wtvenc.c"
    "${SourceDir}/wv.c"
    "${SourceDir}/wv.h"
    "${SourceDir}/wvdec.c"
    "${SourceDir}/wvedec.c"
    "${SourceDir}/wvenc.c"
    "${SourceDir}/xa.c"
    "${SourceDir}/xmv.c"
    "${SourceDir}/xvag.c"
    "${SourceDir}/xwma.c"
    "${SourceDir}/yop.c"
    "${SourceDir}/yuv4mpeg.h"
    "${SourceDir}/yuv4mpegdec.c"
    "${SourceDir}/yuv4mpegenc.c"
)

if(BLURAY)
list(APPEND SourceFiles
    "${SourceDir}/bluray.c"
)
endif()
if(CHROMAPRINT)
list(APPEND SourceFiles
    "${SourceDir}/chromaprint.c"
)
endif()
if(LIBXML)
list(APPEND SourceFiles
    "${SourceDir}/dashdec.c"
)
endif()
if(LIBGME)
list(APPEND SourceFiles
    "${SourceDir}/libgme.c"
)
endif()
if(LIBMODPLUG)
list(APPEND SourceFiles
    "${SourceDir}/libmodplug.c"
)
endif()
if(LIBOPENMPT)
list(APPEND SourceFiles
    "${SourceDir}/libopenmpt.c"
)
endif()
if(LIBRTMP)
list(APPEND SourceFiles
    "${SourceDir}/librtmp.c"
)
endif()
if(LIBSMBCLIENT)
list(APPEND SourceFiles
    "${SourceDir}/libsmbclient.c"
)
endif()
if(LIBSRT)
list(APPEND SourceFiles
    "${SourceDir}/libsrt.c"
)
endif()
if(LIBSSH)
list(APPEND SourceFiles
    "${SourceDir}/libssh.c"
)
endif()

target_sources("avformat" PRIVATE ${SourceFiles})
target_include_directories("avformat" PRIVATE ${HeaderDirs})
target_compile_options("avformat" PRIVATE
    ${CommonCompileOptions}
)
