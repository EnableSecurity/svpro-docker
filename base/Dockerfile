FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y && \
    apt install pkg-config libopus-dev libopusfile-dev unzip jq git build-essential wget -y
RUN git clone https://gitlab.com/akihe/radamsa.git && cd radamsa && make && make install
RUN wget https://github.com/samhocevar/zzuf/releases/download/v0.15/zzuf-0.15.tar.gz -O zzuf.tgz && tar xzvf zzuf.tgz && cd zzuf* && ./configure && make && make install

FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y && \
    apt install pkg-config libopus-dev libopusfile-dev unzip jq curl iptables -y
COPY --from=0 /usr/bin/radamsa /usr/local/bin/radamsa
COPY --from=0 /usr/local/bin/zzuf /usr/local/bin/zzuf


