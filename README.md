xv6 docker
=======

A dockerfile for xv6-riscv (MIT 6.828 course). 

### Usage

**1. Build docker image**

Clone this repo, `cd` to this folder, build the docker image first. For example, naming of the image as `xv6`:

```shell
docker build -t vx6 .
```

Verify the image been build successful:

```txt
$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
vx6                 latest              62816b4e4fe4        11 minutes ago      1.2GB
```

**2. Compile & Run**

Clone the source code of [xv6-riscv](https://github.com/mit-pdos/xv6-riscv) if not done yet. Go into the folder of the sourcecode:

```shell
docker run -it -v "$PWD":/vx6 vx6
```

This will mount the current (source code) folder into the `/vx6` folder in docker container, and also popup a shell for input.

Now compile kernel to verify everything is ok:

```shell
make qemu
```

After some logs, should see indicating kernel been booted succssfully.

```txt
xv6 kernel is booting

hart 1 starting
hart 2 starting
init: starting sh
$
```

**3. GDB**

Run `make qemu-gdb` for keneral startup. Then open another cmd to attach to currently docker container:

```shell
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
1025d4c9ab0a        vx6                 "/bin/bash"         38 seconds ago      Up 38 seconds                           sharp_leavitt
$ docker exec -it 1025d4c9ab0a /bin/sh
# gdb-multiarch
```

using `gdb-multiarch` for debugging purpose.

