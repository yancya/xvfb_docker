FROM ubuntu

RUN apt-get update && apt-get install -y wget && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y xvfb firefox google-chrome-stable nodejs npm && \
    ln -s `which nodejs` /usr/local/bin/node

Add . /var/opt
WORKDIR /var/opt
ENV DISPLAY :99

RUN npm install

CMD rm -f /tmp/.X99-lock && \
    /usr/bin/Xvfb :99 & while [ ! -f /tmp/.X99-lock ]; do sleep 1; done && \
    npm run test