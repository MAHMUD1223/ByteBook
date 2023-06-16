<!-- @format -->

# To check if it's running

if we get a return value that means its working

```bash
docker run hello-world
```

# Playing with busybox and necessary commands

To pull a container. Use container name in place of busybox

```bash
docker pull busybox
```

To check the containers

```bash
docker images
```

To run a container

```bash
docker run busybox
```

That won't return anything but that ran.To check if it's working run

```bash
docker run busybox echo "hi mom!"
```

To check the containers running

```bash
docker ps
#To see all of them
docker ps -a
```

now Running the run command with the -it flags attaches us to an interactive tty in the container. Now we can run as many commands in the container as we want. Take some time to run your favorite commands.

```bash
docker run -it busybox sh
```

To delete a container

```bash
docker rm <container id>
#To delete all at once
docker rm $(docker ps -a -q -f status=exited)
# or we can use
docker container prune
#or
docker rmi
# if we want we can delete them at once we used it by passing '--rm' flag
docker run --rm <container name>
```
