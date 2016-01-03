FROM ubuntu:14.04
RUN apt-get install -y software-properties-common python
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y git-core
RUN apt-get install -y nodejs
RUN git clone https://github.com/tonyseing/compilebox.git /opt/compilebox
WORKDIR "/opt/compilebox/Setup"
RUN sh /opt/compilebox/Setup/Install_14.04.sh
RUN service docker restart
WORKDIR "/opt/compilebox"
RUN /usr/bin/node /opt/compilebox/API/app.js
EXPOSE 80
