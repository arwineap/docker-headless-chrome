FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests wget unzip gnupg ca-certificates \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && wget https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && rm -f chromedriver_linux64.zip \
    && mv ./chromedriver /usr/local/bin/ \
    && apt-get remove --purge -y wget unzip \
    && apt-get -y --purge autoremove \
    && rm -rf /var/lib/apt/lists/*

