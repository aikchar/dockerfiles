FROM opensuse/leap:15.3

COPY bellsoft.repo /etc/zypp/repos.d/

RUN    zypper --gpg-auto-import-keys refresh --repo BellSoft \
    && zypper refresh \
    && zypper install -y bellsoft-java11-runtime-full \
    && update-alternatives --set java "/usr/lib/jvm/bellsoft-java11-runtime-full.$(uname -m)/bin/java"

# https://bell-sw.com/pages/downloads/#/java-11-lts
