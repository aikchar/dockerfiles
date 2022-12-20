DOCKER_CMD := $(shell command -v docker 2> /dev/null)
NOW := $(shell date -u +%Y%m%d%H%M%S)
PODMAN_CMD := $(shell command -v podman 2> /dev/null)
REMOTE_DOCKER_HOST ?= rpi3
REMOTE_DOCKER_FILESYSTEM_PATH ?= dockerfiles/
TEST_AFTER_BUILD ?= false
VCTL_CMD := $(shell command -v vctl 2> /dev/null)

ifdef VCTL_CMD
MULTIARCH_BUILD=
PROGRAM=$(VCTL_CMD)
else
ifdef PODMAN_CMD
MULTIARCH_BUILD=--platform linux/amd64 --platform linux/arm64
PROGRAM=$(PODMAN_CMD)
else
ifdef DOCKER_CMD
MULTIARCH_BUILD=
PROGRAM=$(DOCKER_CMD)
else
$(error None of docker, podman, vctl installed)
endif
endif
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
