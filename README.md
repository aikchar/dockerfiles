# Dockerfiles

This repo contains Dockerfiles for various combinations.

aarch64/arm64/armv8 images are built and tested on Raspberry Pi 3 on Oracle
Linux 9 with Podman.

x86_64 images are built and tested macOS with Podman.

A Makefile is also included to help understand this repo better. You can also
use it to build images quickly. Supports: vctl, podman, and docker.

| Purpose            | Operating System                         | x86_64               | aarch64/arm64        | Notes      |
|--------------------|------------------------------------------|----------------------|----------------------|------------|
| .NET 6 (Runtime)   | Amazon Linux 2022                        | Works                | Build failed         | Could not start container on Raspberry Pi 3 (aarch64) |
| .NET 6 (Runtime)   | openSUSE Leap 15.4                       | Works                | Works                |  |
| .NET 6 (Runtime)   | Oracle Linux 9                           | Works                | Works                |  |
| .NET 6 (Runtime)   | Photon 4.0                               | Works w/ workaround  | Works w/ workaround  | Dockerfile has commented out RUN that supports x86_64 but does not work as of 2022-11-01. Consequently, the less-recommended install method is used. |
| .NET 6 (Runtime)   | Red Hat Enterprise Linux 9 UBI           | Works                | Works                |  |
| Java 17 (JRE)      | Amazon Linux 2022                        | Works                | Build failed         | Amazon Corretto. Could not start container on Raspberry Pi 3 (aarch64). |
| Java 17 (JRE)      | openSUSE Leap 15.4                       | Works                | Works                | OpenJDK |
| Java 17 (JRE)      | Oracle Linux 9                           | Works                | Works                | OpenJDK |
| Java 17 (JRE)      | Photon 4.0                               | Works                | Works                | Uses BellSoft's distribution because of their partnership with VMware. Also uses Oracle Linux 8 repos for some dependencies which are not available in Photon repos. |
| Java 17 (JRE)      | Red Hat Enterprise Linux 9 UBI           | Works                | Works                | OpenJDK |
| systemd            | Debian 12                                | Works                | Works                |  |
| systemd            | openSUSE Leap 15.5                       | Works                | Works                |  |
