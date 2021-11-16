# Dockerfiles

This repo contains Dockerfiles for various combinations.

Most of these are built and tested on Raspberry Pi 3 (aarch64 / arm64 / armv8)
on top of an openSUSE Leap 15.3 host with Podman.

A Makefile is also included to help understand this repo better. You can also
use it to build images quickly. Supports: vctl, podman, and docker.

| Purpose            | Operating System     | Notes      |
|--------------------|----------------------|------------|
| .NET 6             | openSUSE Leap 15.3   | Dockerfile has commented out RUN that supports x86_64. Uncomment it and comment aarch64 RUN as needed. |
| .NET 6             | Oracle Linux 8.4     | Dockerfile uses manual install because .NET 6 is not supported on CentOS 8 and is not available in repos. Dockerfile has commented out RUN that is only supported on x86_64. Uncomment it as needed. |
| .NET 6             | Photon 4.0           | Dockerfile has commented out RUN that supports x86_64. Uncomment it and comment aarch64 RUN as needed. |
| Java 11 (JRE)      | openSUSE Leap 15.3   | Uses BellSoft's distribution because of their partnership with VMware |
| Java 11 (JRE)      | Oracle Linux 8.4     |            |
| Java 11 (JRE)      | Photon 4.0           |  Uses BellSoft's distribution because of their partnership with VMware. Also uses Oracle Linux 8 repos for some dependencies which are not available in Photon repos. |
