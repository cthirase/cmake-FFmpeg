cmake_minimum_required(VERSION 3.15)
project(FFmpeg
    VERSION 4.2.0.0
    DESCRIPTION "FFmpeg is a collection of libraries and tools to process multimedia content such as audio, video, subtitles and related metadata."
    HOMEPAGE_URL "https://github.com/cthirase/cmake-FFmpeg"
    LANGUAGE C CXX ASM_NASM
)

add_executable(ffmpeg)
add_executable(ffplay)
add_executable(ffprobe)
