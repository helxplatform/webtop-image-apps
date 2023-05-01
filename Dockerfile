ARG BASE_IMAGE=containers.renci.org/helxplatform/webtop/base
ARG BASE_IMAGE_TAG=v0.0.2
FROM $BASE_IMAGE:$BASE_IMAGE_TAG as archive-extractor

# Get ImageJ archive.
ENV IMAGEJ_DOWNLOAD_URL="https://wsr.imagej.net/distros/linux/ij153-linux64-java8.zip" \
    IMAGEJ_ARCHIVE=/tmp/image-with-java.zip
WORKDIR /app
ADD $IMAGEJ_DOWNLOAD_URL $IMAGEJ_ARCHIVE
RUN unzip $IMAGEJ_ARCHIVE

# Copy files from /app to new base and elliminate zips.
FROM $BASE_IMAGE:$BASE_IMAGE_TAG
WORKDIR /app
COPY --from=archive-extractor /app /app

# Get Napari archive and logo icon.
ENV NAPARI_VERSION="0.4.17"
ENV NAPARI_DOWNLOAD_URL="https://github.com/napari/napari/releases/download/v$NAPARI_VERSION/napari-$NAPARI_VERSION-Linux-x86_64.sh" \
    NAPARI_INSTALL=/tmp/napari.sh
WORKDIR /tmp
ADD --chmod=755 $NAPARI_DOWNLOAD_URL $NAPARI_INSTALL
# Above chmod didn't work for some reason.
RUN chmod 755 $NAPARI_INSTALL && \
    $NAPARI_INSTALL -b -p /app/Napari && \
    rm $NAPARI_INSTALL

COPY /root /
