<h1 align="center">
  <a href="https://github.com/eyevinn/easyvmaf_s3">
    <img src="https://raw.githubusercontent.com/Eyevinn/easyvmaf_s3/main/logo.svg" alt="Logo" height="100">
  </a>
</h1>

<div align="center">
  easyvmaf_s3 - A modification of <a href="https://github.com/gdavila/easyVmaf">easyVmaf</a> to run on files from an S3-bucket 
  <br />
  <br />
  <a href="https://github.com/eyevinn/easyvmaf_s3/issues/new?assignees=&labels=bug&template=01_BUG_REPORT.md&title=bug%3A+">Report a Bug</a>
  ·
  <a href="https://github.com/eyevinn/easyvmaf_s3/issues/new?assignees=&labels=enhancement&template=02_FEATURE_REQUEST.md&title=feat%3A+">Request a Feature</a>
</div>

<div align="center">
<br />

[![license](https://img.shields.io/github/license/eyevinn/easyvmaf_s3.svg?style=flat-square)](LICENSE)

[![PRs welcome](https://img.shields.io/badge/PRs-welcome-ff69b4.svg?style=flat-square)](https://github.com/eyevinn/easyvmaf_s3/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22)
[![made with hearth by Eyevinn](https://img.shields.io/badge/made%20with%20%E2%99%A5%20by-Eyevinn-59cbe8.svg?style=flat-square)](https://github.com/Eyevinn)

<br />

[![Badge OSC](https://img.shields.io/badge/Evaluate-24243B?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGNpcmNsZSBjeD0iMTIiIGN5PSIxMiIgcj0iMTIiIGZpbGw9InVybCgjcGFpbnQwX2xpbmVhcl8yODIxXzMxNjcyKSIvPgo8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSI3IiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjIiLz4KPGRlZnM%2BCjxsaW5lYXJHcmFkaWVudCBpZD0icGFpbnQwX2xpbmVhcl8yODIxXzMxNjcyIiB4MT0iMTIiIHkxPSIwIiB4Mj0iMTIiIHkyPSIyNCIgZ3JhZGllbnRVbml0cz0idXNlclNwYWNlT25Vc2UiPgo8c3RvcCBzdG9wLWNvbG9yPSIjQzE4M0ZGIi8%2BCjxzdG9wIG9mZnNldD0iMSIgc3RvcC1jb2xvcj0iIzREQzlGRiIvPgo8L2xpbmVhckdyYWRpZW50Pgo8L2RlZnM%2BCjwvc3ZnPgo%3D)](https://app.osaas.io/browse/eyevinn-easyvmaf-s3)

</div>

A Docker-image that can be used to run [easyVmaf](https://github.com/gdavila/easyVmaf) from files in an S3-bucket.

## Usage

### Build and tag the image

```bash
docker build . -t easyvmaf-s3
```

### Run a container

```bash
docker run  --rm \
            -e AWS_ACCESS_KEY_ID=X \
            -e AWS_SECRET_ACCESS_KEY=Y \
            easyvmaf-s3 \
            -r s3://videos/reference.mp4 \
            -d s3://videos/640x360_750000.mp4 \
            -o s3://videos/640x360_750000_vmaf.json
```

### Using a custom S3 endpoint

For S3-compatible services like MinIO, you can specify a custom endpoint:

```bash
docker run  --rm \
            -e AWS_ACCESS_KEY_ID=X \
            -e AWS_SECRET_ACCESS_KEY=Y \
            -e S3_ENDPOINT_URL=https://minio.example.com \
            easyvmaf-s3 \
            -r s3://videos/reference.mp4 \
            -d s3://videos/640x360_750000.mp4 \
            -o s3://videos/640x360_750000_vmaf.json
```

### Run with `docker-compose`
```yml
services:
  autovmaf-s3:
    build: .
  image: easyvmaf-s3
  environment:
    - AWS_ACCESS_KEY=X
    - AWS_SECRET_ACCESS_KEY=Y
    # Optional: for custom S3-compatible endpoints
    - S3_ENDPOINT_URL=https://minio.example.com
  command: easyvmaf-s3 -r s3://videos/reference.mp4 -d s3://videos/640x360_750000.mp4 -o s3://videos/640x360_750000_vmaf.json
```

## Additional options
```
usage: easyvmaf_s3.py [-h] -r REFERENCE_INPUT -d DISTORTED_INPUT -o
                      OUTPUT [--phone] [--model MODEL]

Run easyVMAF on file in S3-bucket.

optional arguments:
  -h, --help          show this help message and exit
  -r REFERENCE_INPUT  The s3-url of the reference input. Example:
                      s3://input-bucket/reference.mp4
  -d DISTORTED_INPUT  The s3-url of the distorted input. Example:
                      s3://input-bucket/distorted.mp4
  -o OUTPUT           The s3-url of the output. This file will be
                      created Example: s3://output-
                      bucket/file_vmaf.json
  --phone             Whether or not to use the phone model for VMAF
                      analysis.
  --model MODEL       The VMAF-model to use. Either HD or 4K.
```

# About Eyevinn Technology

Eyevinn Technology is an independent consultant firm specialized in video and streaming. Independent in a way that we are not commercially tied to any platform or technology vendor.

At [Eyevinn](https://github.com/Eyevinn), every software developer consultant has a dedicated budget reserved for open source development and contribution to the open source community. This gives us room for innovation, team building and personal competence development. And also gives us as a company a way to contribute back to the open source community.

Want to know more about Eyevinn and how it is to work here? Contact us at work@eyevinn.se!
