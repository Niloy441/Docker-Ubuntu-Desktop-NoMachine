FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    x11vnc \
    xvfb \
    novnc \
    websockify \
    curl \
    wget \
    nano \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.vnc && \
    x11vnc -storepasswd 123456 /root/.vnc/passwd

COPY nxserver.sh /nxserver.sh
RUN chmod +x /nxserver.sh

EXPOSE 8080

ENTRYPOINT ["/nxserver.sh"]
