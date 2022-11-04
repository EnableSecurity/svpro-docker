# SIPVicious PRO docker image

This repository is meant to help SIPVicious PRO users run the toolset in an environment
that has all the necessary requirements.

NOTE: This docker image does not contain SIPVicious PRO!

You will need a valid subscription to SIPVicious PRO for this docker image to be useful.
For further information, consult the [product page](https://www.enablesecurity.com/sipvicious/pro/).

## Quick start

First time users need to build the `svpro` docker image as follows:

```bash
SVPRO_URL=https://downloadurl docker-compose build svpro
```

NOTE: to obtain the download URL, you will need a valid subscription to SIPVicious PRO.

After that you can make use of SIPVicious PRO as follows:

```bash
docker-compose run svpro
sipvicious sip utils ping udp://demo.sipvicious.pro:5060
```

The host working directory is mapped to `/home` and the working directory in the Docker 
container is set to `/home` so that templates and other files can be shared.

## Upgrading

To upgrade to the latest version, run the following command:


```bash
SVPRO_URL=https://downloadurl docker-compose build --no-cache svpro
```

## Installing a special build

To make use of an alternative download file, instead of the default (`sipviciouspro-latest.zip`), make use of an additional environment variable `SVPRO_DLFN` when building. For example:

```bash
SVPRO_URL=https://downloadurl SVPRO_DLFN=sipviciouspro-delux.zip docker-compose build svpro
```

## Adding a helper tool

If you would like to run sipvicious without having to type docker or docker-compose commands, you can place a bash script in your `$PATH` (e.g. in `/usr/local/bin`) containing the something like following:

```bash
#!/bin/bash
cd /path/to/svpro-docker
docker-compose run svpro sipvicious $@
```
