FROM frolvlad/alpine-python3
MAINTAINER sparklyballs

# set python to use utf-8 rather than ascii.
ENV PYTHONIOENCODING="UTF-8"

# add local files
COPY root/ /

# ports and volumes
EXPOSE 3467
WORKDIR /app/sonarrannounced
VOLUME /config /logs
