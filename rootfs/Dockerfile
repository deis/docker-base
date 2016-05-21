FROM gcr.io/google_containers/ubuntu-slim:0.2

ENV TERM=xterm

RUN apt-get update && \
apt-get install -y \
	bash \
	curl \
	net-tools \
	procps && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc
