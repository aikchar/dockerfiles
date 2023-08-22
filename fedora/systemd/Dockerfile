FROM quay.io/fedora/fedora:38

RUN    dnf update \
    && dnf install -y procps-ng systemd

CMD [ "/sbin/init" ]
