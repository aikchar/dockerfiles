FROM registry.opensuse.org/opensuse/leap:15.5

RUN    zypper refresh \
    && zypper install -y dbus-1 systemd systemd-sysvinit

CMD [ "/sbin/init" ]

# https://dhenandi.com/how-to-running-systemd-on-opensuse-docker-container/
