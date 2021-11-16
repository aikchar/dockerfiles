FROM opensuse/leap:15

COPY *.rpm /tmp/

RUN    zypper refresh \
    && zypper install -y --gpg-auto-import-keys /tmp/*.rpm

ENV PATH="/usr/lib/jvm/bellsoft-java11-runtime.aarch64/bin:${PATH}"

# https://bell-sw.com/pages/downloads/#/java-11-lts
