#!/bin/sh
if ! [ -n "$SVPRO_URL" ]; then
  echo "Please set the SVPRO_URL environment variable"
  exit 1
fi

MACHINE_TYPE=$(uname -m)
if [ ${MACHINE_TYPE} = 'armhf' ]; then
    ARCH=armhf
elif [ ${MACHINE_TYPE} = 'aarch64' ]; then
    ARCH=arm64
elif [ ${MACHINE_TYPE} = 'x86_64' ]; then
    ARCH=amd64
elif [ ${MACHINE_TYPE} = 'i386' ]; then
    ARCH=386
else
    echo "Unknown architecture"
    exit 1
fi

curl -G \
    --data-urlencode "path=/" \
    --data-urlencode "files=${SVPRO_DLFN}" \
    "${SVPRO_URL}/download" -o sipvicious.zip

unzip -p sipvicious.zip linux/${ARCH}/sipvicious > /usr/local/bin/sipvicious
chmod +x /usr/local/bin/sipvicious
rm -f sipvicious.zip setup.sh
