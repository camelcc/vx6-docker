FROM debian:bullseye

ENV USER root

#install dependencies
RUN apt-get update && \
    apt-get install -y git build-essential gdb-multiarch qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu 

RUN echo "set auto-load safe-path /" > /root/.gdbinit

WORKDIR /vx6
VOLUME /vx6

CMD ["/bin/bash"]


