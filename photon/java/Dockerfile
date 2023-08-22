FROM docker.io/library/photon:5.0

COPY bellsoft.repo /etc/yum.repos.d/

RUN    tdnf --enablerepo=BellSoft makecache \
    && tdnf install --enablerepo=BellSoft -y bellsoft-java17-runtime-full

# https://bell-sw.com/pages/downloads/#/java-17-lts
