FROM debian:12

RUN    apt update \
    && apt install -y procps systemd systemd-sysv

CMD [ "/sbin/init" ]

# https://wiki.debian.org/systemd#Installing_and_Testing
# https://developers.redhat.com/blog/2016/09/13/running-systemd-in-a-non-privileged-container#docker_upstream_vs__systemd
# https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container#enter_podman
