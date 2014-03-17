FROM ubuntu:13.10
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -yy wine lib32ncurses5
RUN apt-get install -yy python2.7

ADD download.py /opt/blockland/download.py
WORKDIR /opt/blockland
RUN python2.7 download.py

ADD launch /opt/blockland/launch
ENTRYPOINT ["./launch"]

