FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y wget \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && wget https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && rm -f chromedriver_linux64.zip \
    && mv ./chromedriver /usr/local/bin/ \
    && rm -rf /var/lib/apt/lists/*

