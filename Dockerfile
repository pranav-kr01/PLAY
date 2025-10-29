FROM mcr.microsoft.com/playwright:v1.39.0-focal

# Install xvfb and x11vnc
RUN apt-get update && apt-get install -y \
    xvfb \
    x11vnc \
    && rm -rf /var/lib/apt/lists/*

# Set up VNC password
RUN mkdir ~/.vnc && x11vnc -storepasswd mysecretpassword ~/.vnc/passwd

# Copy your test files
COPY . /tests
WORKDIR /tests

# Install dependencies
RUN npm install

# Expose VNC port
EXPOSE 5900

# Start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]