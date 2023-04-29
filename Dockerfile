ARG BASE_IMAGE=containers.renci.org/helxplatform/webtop/base
ARG BASE_IMAGE_TAG=v0.0.2
FROM $BASE_IMAGE:$BASE_IMAGE_TAG as imagej-zip-extractor

ENV IMAGEJ_DOWNLOAD_URL="https://wsr.imagej.net/distros/linux/ij153-linux64-java8.zip" \
    IMAGEJ_ARCHIVE=/tmp/image-with-java.zip
WORKDIR /app
ADD $IMAGEJ_DOWNLOAD_URL $IMAGEJ_ARCHIVE
RUN unzip $IMAGEJ_ARCHIVE

# Copy extracted zip files to new base and elliminate zip archive.
FROM $BASE_IMAGE:$BASE_IMAGE_TAG
COPY --from=imagej-zip-extractor /app /app
COPY /root /  
