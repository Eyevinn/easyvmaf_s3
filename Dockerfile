FROM gfdavila/easyvmaf:2.0
RUN pip3 install boto3
WORKDIR  /app/easyVmaf
COPY easyvmaf_s3.py easyvmaf_s3.py
ENTRYPOINT [ "python3", "easyvmaf_s3.py" ]

