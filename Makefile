DOCKER_CMD := $(shell command -v docker 2> /dev/null)
NOW := $(shell date -u +%Y%m%d%H%M%S)
NERDCTL_CMD := $(shell command -v nerdctl 2> /dev/null)
PODMAN_CMD := $(shell command -v podman 2> /dev/null)
REMOTE_DOCKER_HOST ?= rpi3
REMOTE_DOCKER_FILESYSTEM_PATH ?= dockerfiles/
TEST_AFTER_BUILD ?= false
VCTL_CMD := $(shell command -v vctl 2> /dev/null)

ifdef DOCKER_CMD
else
ifdef NERDCTL_CMD
else
ifdef PODMAN_CMD
else
ifdef VCTL_CMD
else
$(error One of docker, nerdctl, podman, vctl must be installed)
endif
endif
endif
endif

AMD64_BUILD=
ARM64_BUILD=
MULTIARCH_BUILD=

ifdef VCTL_CMD
PROGRAM=$(VCTL_CMD)
endif

ifdef DOCKER_CMD
PROGRAM=$(DOCKER_CMD)
endif

ifdef NERDCTL_CMD
PROGRAM=$(NERDCTL_CMD)
endif

ifdef PODMAN_CMD
AMD64_BUILD=--platform linux/amd64
ARM64_BUILD=--platform linux/arm64
MULTIARCH_BUILD=--platform linux/amd64 --platform linux/arm64
PROGRAM=$(PODMAN_CMD)
endif


.PHONY: help
help:
	@echo Using: $(PROGRAM)
	@echo Targets:
	@grep '^[0-9A-Za-z-]*:$$' Makefile | grep -v grep | sed -e 's/:$$//g' -e 's/^/\t/g'

.PHONY: sync-remote-docker-host
sync-remote-docker-host:
	rsync -av * -e ssh $(REMOTE_DOCKER_HOST):$(REMOTE_DOCKER_FILESYSTEM_PATH)

.PHONY: build-dotnet-amazon-linux
build-dotnet-amazon-linux:
	cd amazon-linux/dotnet && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/dotnet/amazon-linux-2022:$(NOW) .

.PHONY: build-dotnet-opensuse
build-dotnet-opensuse:
	cd opensuse/dotnet && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/dotnet/opensuse-leap-15.4:$(NOW) .

.PHONY: build-dotnet-oracle-linux
build-dotnet-oracle-linux:
	cd oracle-linux/dotnet && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/dotnet/oracle-linux-9:$(NOW) .

.PHONY: build-dotnet-photon
build-dotnet-photon:
	cd photon/dotnet && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/dotnet/photon-4.0:$(NOW) .

.PHONY: build-dotnet-rhel-ubi
build-dotnet-rhel-ubi:
	cd rhel-ubi/dotnet && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/dotnet/rhel-ubi-9:$(NOW) .

.PHONY: build-java-amazon-linux
build-java-amazon-linux:
	cd amazon-linux/java && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/java/amazon-linux-2022:$(NOW) .

.PHONY: build-java-opensuse
build-java-opensuse:
	cd opensuse/java && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/java/opensuse-leap-15.4:$(NOW) .

.PHONY: build-java-oracle-linux
build-java-oracle-linux:
	cd oracle-linux/java && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/java/oracle-linux-9:$(NOW) .

.PHONY: build-java-photon
build-java-photon:
	cd photon/java && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/java/photon-4.0:$(NOW) .

.PHONY: build-java-rhel-ubi
build-java-rhel-ubi:
	cd rhel-ubi/java && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/java/rhel-ubi-9:$(NOW) .

.PHONY: build-python-amazon-linux-amd64
build-python-amazon-linux-amd64:
	cd amazon-linux/python && '$(PROGRAM)' build $(AMD64_BUILD) -t localhost/python/amazon-linux-2022-amd64:$(NOW) -f Dockerfile.amd64 .

.PHONY: build-python-amazon-linux-arm64
build-python-amazon-linux-arm64:
	cd amazon-linux/python && '$(PROGRAM)' build $(ARM64_BUILD) -t localhost/python/amazon-linux-2022-arm64:$(NOW) -f Dockerfile.arm64 .

.PHONY: build-python-opensuse-amd64
build-python-opensuse-amd64:
	cd opensuse/python && '$(PROGRAM)' build $(AMD64_BUILD) -t localhost/python/opensuse-leap-15.4-amd64:$(NOW) -f Dockerfile.amd64 .

.PHONY: build-python-opensuse-arm64
build-python-opensuse-arm64:
	cd opensuse/python && '$(PROGRAM)' build $(ARM64_BUILD) -t localhost/python/opensuse-leap-15.4-arm64:$(NOW) -f Dockerfile.arm64 .

.PHONY: build-python-oracle-linux-amd64
build-python-oracle-linux-amd64:
	cd oracle-linux/python && '$(PROGRAM)' build $(AMD64_BUILD) -t localhost/python/oracle-linux-9-amd64:$(NOW) -f Dockerfile.amd64 .

.PHONY: build-python-oracle-linux-arm64
build-python-oracle-linux-arm64:
	cd oracle-linux/python && '$(PROGRAM)' build $(ARM64_BUILD) -t localhost/python/oracle-linux-9-arm64:$(NOW) -f Dockerfile.arm64 .

.PHONY: build-python-photon-amd64
build-python-photon-amd64:
	cd photon/python && '$(PROGRAM)' build $(AMD64_BUILD) -t localhost/python/photon-4.0-amd64:$(NOW) -f Dockerfile.amd64 .

.PHONY: build-python-photon-arm64
build-python-photon-arm64:
	cd photon/python && '$(PROGRAM)' build $(ARM64_BUILD) -t localhost/python/photon-4.0-arm64:$(NOW) -f Dockerfile.arm64 .

.PHONY: build-python-rhel-ubi-amd64
build-python-rhel-ubi-amd64:
	cd rhel-ubi/python && '$(PROGRAM)' build $(AMD64_BUILD) -t localhost/python/rhel-ubi-9-amd64:$(NOW) -f Dockerfile.amd64 .

.PHONY: build-python-rhel-ubi-arm64
build-python-rhel-ubi-arm64:
	cd rhel-ubi/python && '$(PROGRAM)' build $(ARM64_BUILD) -t localhost/python/rhel-ubi-9-arm64:$(NOW) -f Dockerfile.arm64 .

.PHONY: build-systemd-debian
build-systemd-debian:
	cd debian/systemd && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/systemd/debian-9:$(NOW) -f Dockerfile .

.PHONY: build-systemd-fedora
build-systemd-fedora:
	cd fedora/systemd && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/systemd/fedora-39:$(NOW) -f Dockerfile .

.PHONY: build-systemd-opensuse
build-systemd-opensuse:
	cd opensuse/systemd && '$(PROGRAM)' build $(MULTIARCH_BUILD) -t localhost/systemd/opensuse-leap-15.5:$(NOW) -f Dockerfile .
