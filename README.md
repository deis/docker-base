# Deis Base

[![Build Status](https://travis-ci.org/deis/docker-base.svg?branch=master)](https://travis-ci.org/deis/docker-base) [![Docker Repository on Quay](https://quay.io/repository/deis/base/status "Docker Repository on Quay")](https://quay.io/repository/deis/base)

A slimmed-down Ubuntu-based container image used as the basis of [Deis Workflow][] and other components.

## Usage

Start your Dockerfile with this line:

```
FROM quay.io/deis/base:v0.3.5
```

There isn't a `:latest` tag, because tagged container images should be immutable.

The latest deis/base image is available at:

* [Quay.io][]
  ```
  docker pull quay.io/deis/base:v0.3.5
  ```

* [Docker Hub][]
  ```
  docker pull deis/base:v0.3.5
  ```

[Deis Workflow]: https://deis.com/
[Quay.io]: https://quay.io/repository/deis/base
[Docker Hub]: https://hub.docker.com/r/deis/base/
