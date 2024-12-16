#!/bin/bash

# 启动虚拟显示服务器（Xvfb）
Xvfb :0 -screen 0 1024x768x24 &

# 设置环境变量来使用 Xvfb 的显示
export DISPLAY=:0

# 启动 GNOME 桌面会话
gnome-session &

# 启动 VNC 服务，绑定到显示器 :0（5900 端口）
x11vnc -display :0 -forever -passwd yourpassword -bg -o /var/log/x11vnc.log

# 保持容器运行
tail -f /dev/null
