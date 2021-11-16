FROM opensuse/leap:15

COPY bellsoft.repo /etc/zypp/repos.d/

RUN    zypper refresh \
    && zypper refresh --repo BellSoft \
    && zypper install -y --from BellSoft -y bellsoft-java11

ENV PATH="/usr/lib/jvm/bellsoft-java11-runtime.aarch64/bin:${PATH}"

# https://bell-sw.com/pages/downloads/#/java-11-lts
