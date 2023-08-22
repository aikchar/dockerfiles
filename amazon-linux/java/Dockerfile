FROM amazonlinux:2023

RUN    dnf makecache \
    && dnf install -y java-17-amazon-corretto-headless

# arm64 / aarch64 not supported as I could not start container on rpi3

# https://docs.aws.amazon.com/corretto/latest/corretto-17-ug/amazon-linux-install.html
