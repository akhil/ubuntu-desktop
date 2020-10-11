FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV USER root

RUN apt-get update && apt-get install -y wget curl gnupg

RUN wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -

RUN echo "deb http://deb.anydesk.com/ all main" | tee /etc/apt/sources.list.d/anydesk-stable.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends ubuntu-desktop && \
    apt-get install -y nautilus gnome-terminal && \
    apt-get install -y anydesk && \
    apt-get install -y xrdp && \
    mkdir /root/.vnc

#CMD ["systemctl enable --now xrdp"]
#CMD ["bash"]
