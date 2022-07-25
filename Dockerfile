FROM zokidoki/ubuntu22.04_base:1.0
#You must update each and every time
RUN apt-get update

ARG username=ubuntu
ARG groupname=dockdev
#Obviously bad practive to put a password in a git file.
#This is a placeholdeer to be changed.
#Though you don't really need a password in a docker image.
#But this image exists for dev purposes not to be carried out under root.
ARG password=ubuntu

#Add non-root user.
RUN groupadd -g 2000 ${groupname} >/dev/null 2>/dev/null
RUN useradd -p "$(openssl passwd -1 ${password})" --shell /bin/bash --gid 2000 --uid 555 -m ${username} >/dev/null 2>/dev/null
RUN usermod -aG sudo ${username} >/dev/null 2>/dev/null

USER ubuntu
WORKDIR /home/ubuntu/

