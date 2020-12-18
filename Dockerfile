FROM ghcr.io/cradle8810/ffmpeg-mp4box-image:v0.0.3
LABEL org.opencontainers.image.source https://github.com/cradle8810/ffmpeg-heic

COPY  exec.sh /bin/exec.sh

WORKDIR /work

ENTRYPOINT [ "sh", "/bin/exec.sh" ]