# Dockerfiles

This repo contains Dockerfiles for various combinations.

Most of these are built and tested on Raspberry Pi 3 (aarch64 / arm64 / armv8)
on top of an openSUSE 15 host with Podman.

A Makefile is also included to help understand this repo better. You can also
use it to build images quickly. Supports: vctl, podman, and docker.

| Purpose            | Operating System     | Notes      |
|--------------------|----------------------|------------|
| .NET 6             | openSUSE 15          |            |
| .NET 6             | Photon 4.0           |            |
| Java 11 (JRE)      | openSUSE 15          | Uses BellSoft's distribution because of their partnership with VMware |
| Java 11 (JRE)      | Photon 4.0           |  Uses BellSoft's distribution because of their partnership with VMware. Also uses Oracle Linux 8 repos for some dependencies which are not available in Photon repos. |
