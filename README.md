# GoCD workstation in docker

This image is meant for GoCD developers. It has all tools that you need
to contribute to GoCD.

Built on top of [tomzo/gocd-ide](https://github.com/tomzo/docker-gocd-ide), contains
additional tools for human developers:

 * intellij idea - IDE for java development
 * terminator - X terminal emulator to execute build commands
 * firefox - for testing the gocd server

## Using with docker

You can start docker in **non-interactive** mode
```
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/code/gocd:/ide/work -v ~:/ide/identity:ro -e DISPLAY="unix:0.0" tomzo/gocd-workstation
```
This will open intellij and terminator.

You can also start docker in **interactive** mode.
```
docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/code/gocd:/ide/work -v ~:/ide/identity:ro -e DISPLAY="unix:0.0" tomzo/gocd-workstation
```

This will put you in the container in `bash` shell.
All tools from [gocd IDE image](https://github.com/tomzo/docker-gocd-ide)
 are available + you can start intellij with

```
intellij &
```

## Using with docker-compose (and dockerstation)

Add this to your `docker-compose.yml`
```
gocd:
  image: tomzo/gocd-workstation:<TAG>
  container_name: gocdide
  mem_limit: 4096M # recommended
  environment:
    DISPLAY: unix:0.0
  stdin_open: false
  tty: false
  volumes:
   - /tmp/.X11-unix:/tmp/.X11-unix
   - /home/tomzo/code/gocd:/ide/work
```
