#!/bin/bash
Xvfb :1 -screen 0 1600x900x24 &
sleep 2
DISPLAY=:1 startxfce4 &
sleep 3
x11vnc -display :1 -rfbauth /root/.vnc/passwd -forever -loop -noxdamage -repeat -rfbport 5900 &
websockify --web /usr/share/novnc 8080 localhost:5900
