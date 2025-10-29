#!/bin/bash

# Start virtual display
Xvfb :99 -screen 0 1280x1024x24 &

# Export display for applications
export DISPLAY=:99

# Start VNC server
x11vnc -forever -usepw -display :99 &

# Run your tests (modify this command according to your test script)
npm run test