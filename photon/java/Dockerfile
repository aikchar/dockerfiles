FROM docker.io/library/photon:5.0

COPY bellsoft.repo /etc/yum.repos.d/
COPY oracle-linux-9.repo /etc/yum.repos.d/

RUN    tdnf --enablerepo=ol9 --enablerepo=BellSoft makecache \
    && tdnf install --enablerepo=ol9 --enablerepo=BellSoft -y bellsoft-java17-runtime-full

# https://bell-sw.com/pages/downloads/#/java-17-lts
