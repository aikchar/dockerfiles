FROM amazonlinux:2023

RUN    dnf update \
    && dnf install -y cpio dnf-plugins-core procps-ng systemd

CMD [ "/sbin/init" ]
