FROM svprobase
ARG SVPRO_URL
ARG SVPRO_DLFN=sipviciouspro-latest.zip
ADD scripts/setup.sh .
RUN chmod +x ./setup.sh && ./setup.sh