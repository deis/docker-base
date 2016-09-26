FROM gcr.io/google_containers/ubuntu-slim:0.4

ENV TERM=xterm

# disable source repos (speeds up apt-get update)
RUN sed -i -e 's/^deb-src/#deb-src/' /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y --no-install-recommends && \
    apt-get install -y --no-install-recommends \
        bash \
        curl \
        net-tools \
        procps && \
    # cleanup
    apt-get autoremove -y && \
    apt-get clean -y && \
    # package up license files if any
    tar -czf /usr/share/copyrights.tar.gz /usr/share/common-licenses* /usr/share/doc/*/copyright && \
    rm -rf \
        /usr/share/doc \
        /usr/share/man \
        /usr/share/info \
        /usr/share/locale \
        /var/lib/apt/lists/* \
        /var/log/* \
        /var/cache/debconf/* \
        /usr/share/common-licenses* \
        /etc/systemd \
        /lib/lsb \
        /lib/udev \
        /usr/lib/x86_64-linux-gnu/gconv/IBM* \
        /usr/lib/x86_64-linux-gnu/gconv/EBC* && \
    bash -c "mkdir -p /usr/share/man/man{1..8}"
