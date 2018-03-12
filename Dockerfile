FROM hasholding/alpine-base

LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"

ARG VERSION=1.5.0
ENV INFLUXDB_CONFIG_PATH /etc/influxdb.conf
VOLUME ["/srv/influxdb/meta","/srv/influxdb/data","/srv/influxdb/wal"]
WORKDIR /tmp
RUN apk add --no-cache wget 
RUN wget --no-cache https://dl.influxdata.com/influxdb/releases/influxdb-${VERSION}-static_linux_amd64.tar.gz -O influxdb.tar.gz
RUN tar xvfz influxdb.tar.gz  --strip 2
RUN cp influxd /bin
RUN rm -r *
COPY influxdb.conf /etc/influxdb.conf
EXPOSE 8086 8088 
CMD ["/bin/influxd"]