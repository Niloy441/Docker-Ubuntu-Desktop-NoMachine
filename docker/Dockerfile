FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xfce4 \
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

EXPOSE 8080

CMD bash -c "Xvfb :1 -screen 0 1600x900x24 & \
    sleep 2 && DISPLAY=:1 startxfce4 & \
    sleep 3 && x11vnc -display :1 -rfbauth /root/.vnc/passwd \
    -forever -loop -noxdamage -repeat -rfbport 5900 & \
    websockify --web /usr/share/novnc 8080 localhost:5900"
