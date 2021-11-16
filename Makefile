DOCKER_CMD := $(shell /usr/bin/command -v docker 2> /dev/null)
NOW := $(shell date -u +%Y%m%d%H%M%S)
PODMAN_CMD := $(shell /usr/bin/command -v podman 2> /dev/null)
VCTL_CMD := $(shell /usr/bin/command -v vctl 2> /dev/null)

ifdef VCTL_CMD
PROGRAM=$(VCTL_CMD)
else
ifdef PODMAN_CMD
PROGRAM=$(PODMAN_CMD)
else
ifdef DOCKER_CMD
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

.PHONY: build-dotnet-opensuse
build-dotnet-opensuse:
	cd opensuse/dotnet && $(PROGRAM) build -t localhost/dotnet/opensuse15:$(NOW)

.PHONY: build-dotnet-photon
build-dotnet-photon:
	cd photon/dotnet && $(PROGRAM) build -t localhost/dotnet/photon4:$(NOW)

.PHONY: build-java-opensuse
build-java-opensuse:
	cd opensuse/java && $(PROGRAM) build -t localhost/java/opensuse15:$(NOW)

.PHONY: build-java-photon
build-java-photon:
	cd photon/java && $(PROGRAM) build -t localhost/java/photon4:$(NOW)
