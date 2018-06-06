# Docker image for Emacs on Alpine Linux

[![Docker Build Status](https://img.shields.io/docker/build/cormacc/alpine-emacs-git.svg)](https://hub.docker.com/r/cormacc/alpine-emacs-git/)

Emacs from Alpine community repository with MELPA setting.

* Alpine Linux v3.10
* Emacs v26.3
* git

Forked from iquiw/alpine-emacs
>>>>>>> Added git -- updated README

## How to use this image

```console
$ docker run -it cormacc/alpine-emacs-git
```

## Environment Variables

### `EMACS_PACKAGES`

This variable specifies space separated list of packages.
They are installed automatically when the container is executed.
