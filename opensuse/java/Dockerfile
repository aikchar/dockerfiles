FROM opensuse/leap:15

COPY bellsoft.repo /etc/zypp/repos.d/

RUN    zypper --gpg-auto-import-keys refresh --repo BellSoft \
    && zypper refresh \
    && zypper install -y bellsoft-java11 \
    && update-alternatives --set java "/usr/lib/jvm/bellsoft-java11.$(uname -m)/bin/java" \
    && update-alternatives --set javac "/usr/lib/jvm/bellsoft-java11.$(uname -m)/bin/javac"

# https://bell-sw.com/pages/downloads/#/java-11-lts
