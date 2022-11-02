FROM docker.io/library/photon:4.0

COPY bellsoft.repo /etc/yum.repos.d/
COPY oracle-linux-8.repo /etc/yum.repos.d/

RUN    tdnf --enablerepo=ol8 --enablerepo=BellSoft makecache \
    && tdnf install --enablerepo=ol8 --enablerepo=BellSoft -y bellsoft-java17-runtime-full

# https://bell-sw.com/pages/downloads/#/java-17-lts

# Also installs jaotc but not javac
