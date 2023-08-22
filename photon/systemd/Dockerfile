FROM docker.io/library/photon:5.0

RUN    tdnf makecache \
    && tdnf install -y cpio procps-ng systemd

CMD [ "/sbin/init" ]
