FROM amazonlinux:2023

RUN    dnf makecache \
    && dnf install -y aspnetcore-runtime-6.0

# arm64 / aarch64 not supported as I could not start container on rpi3

# https://learn.microsoft.com/en-us/dotnet/core/install/linux-fedora
