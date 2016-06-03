FROM gcr.io/google_containers/ubuntu-slim:0.3

ENV TERM=xterm

# disable source repos (speeds up apt-get update)
RUN sed -i -e 's/^deb-src/#deb-src/' /etc/apt/sources.list && \
apt-get update && \
apt-get install -y \
	bash \
	curl \
	net-tools \
	procps && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc
