FROM debian:buster

MAINTAINER Frank Villaro-Dixon <frank@villaro-dixon.eu>

ENV DEBIAN_FRONTEND noninteractive

# Versions.
ENV BOINC_CLIENT 7.14.2+dfsg-3

# Update and install minimal.
RUN \
  apt-get update \
  && apt-get install \
     --yes \
     --no-install-recommends \
     --no-install-suggests \
     boinc-client=${BOINC_CLIENT} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


COPY boinc_run.sh /usr/bin/

ONBUILD VOLUME /data
WORKDIR /data

CMD ["boinc_run.sh"]
