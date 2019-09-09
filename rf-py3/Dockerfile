FROM alpine:latest

RUN mkdir -p /work_dir
WORKDIR /work_dir
VOLUME /work_dir

RUN apt-get update 
    && apt-get install -y --no-install-recommends python3 python3-pip python3-dev curl gnupg2 libglib2.0-0 libnss3 libx11-6

RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt-get -yqq update \
    && apt-get -yqq install google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install setuptools Wheel 
RUN pip3 install robotframework robotframework-databaselibrary robotframework-seleniumlibrary \
        robotframework-sudslibrary-aljcalandra robotframework-excel selenium suds-jurko suds-requests \
        robotframework-imaplibrary

RUN pip3 install webdrivermanager
RUN webdrivermanager firefox chrome --linkpath /usr/local/bin

RUN dpkg-divert --add --rename --divert /opt/google/chrome/google-chrome.real /opt/google/chrome/google-chrome
RUN echo "#!/bin/bash\nexec /opt/google/chrome/google-chrome.real --headless --no-sandbox --disable-gpu --disable-setuid-sandbox \"\$@\"" > /opt/google/chrome/google-chrome
RUN chmod 755 /opt/google/chrome/google-chrome

CMD python3 -m robot.run . 