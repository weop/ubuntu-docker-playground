##ubuntu docker playground

a quick vagrant docker host running ubuntu 14.04 for developing docker images. (read: alternative to boo2docker)

what the box does
- auto installs latest docker package from official repo.
- spawns the docker daemon.

to work on containers using this machine, the environment variable DOCKER_HOST needs to be set.
```
export DOCKER_HOST=tcp://192.168.10.10:2375
```

osx users can use obtain docker from brew.
```
brew install docker
```

...and run then run pretty much anything the docker client.
```
docker run busybox echo Hello, World!
```
