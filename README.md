# ffmpeg-heic

Create HEIC Image from your Image file

## usage

The heic file will be created in the same directory.

```bash
docker run --rm -v $(pwd):/work ghcr.io/cradle8810/ffmpeg-heic $(pwd)/<your image file>
```

This docker image allows only one file by argument.
If you want to pass multiple files, use `xargs(1)` with `-n 1` option.

```bash
ls -1 | xargs -n 1 docker run --rm -v $(pwd):/work ghcr.io/cradle8810/ffmpeg-heic 
```