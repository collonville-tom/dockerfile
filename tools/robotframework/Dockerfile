FROM ubuntu:26.04

RUN mkdir -p /work_dir
WORKDIR /work_dir
VOLUME /work_dir

RUN apt-get update \
    && apt-get install -y --no-install-recommends python3 python3-pip python3-dev curl gnupg2 libglib2.0-0 libnss3 libx11-6 wget \
    && apt-get clean \
	&& rm -rf /var/lib/apt/lists/

RUN python3 -m pip install --no-cache-dir --break-system-packages --upgrade setuptools wheel
RUN python3 -m pip install --no-cache-dir --break-system-packages robotframework \
        robotframework-databaselibrary robotframework-seleniumlibrary \
        robotframework-sudslibrary-aljcalandra robotframework-excel selenium \
        robotframework-imaplibrary


# a supprimé car peut etre inutile aujourd'hui? a tester        
#RUN sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' \
#    && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | tee /etc/apt/trusted.gpg.d/google.asc >/dev/null \
#    && apt-get -yqq update \
#    && apt-get -yqq install google-chrome-stable \
#    && apt-get clean \
#	 && rm -rf /var/lib/apt/lists/


#RUN python3 -m pip install --no-cache-dir --break-system-packages webdriver-manager
#RUN webdriver-manager firefox chrome --linkpath /usr/local/bin

#RUN dpkg-divert --add --rename --divert /opt/google/chrome/google-chrome.real /opt/google/chrome/google-chrome
#RUN echo "#!/bin/bash\nexec /opt/google/chrome/google-chrome.real --headless --no-sandbox --disable-gpu --disable-setuid-sandbox \"\$@\"" > /opt/google/chrome/google-chrome
#RUN chmod 755 /opt/google/chrome/google-chrome

CMD python3 -m robot.run . 