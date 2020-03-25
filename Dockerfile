FROM ubuntu:16.04

#ARG UID
#ARG GID

ARG compiler=gcc-arm-none-eabi-7-2018-q2-update

# Base packages and compilers
RUN apt-get update &&   \
    apt-get install -y  \
    build-essential     \
    gcc-arm-none-eabi   \
    cmake               \
    git                 \
    sudo                \
    make                \
    autoconf

#RUN wget https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/7-2018q2/${compiler}-linux.tar.bz2 && \
#    tar

# Add user and super user privilages
RUN mkdir -p /home/user                                 \
    && useradd -d /home/user -s /bin/bash user          \
    && echo "user ALL=(ALL:ALL) ALL" >> /etc/sudoers    \
    && echo "user:user" | chpasswd                      \
    && chown -R user:user /home/user

WORKDIR /home/user/

USER user
