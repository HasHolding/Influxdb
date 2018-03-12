FROM hasholding/alpine-base

LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"

ARG VERSION=1.5.0
ENV INFLUXDB_CONFIG_PATH /etc/influxdb/influxdb.conf
VOLUME /data
RUN mkdir /bin/influxdb 
WORKDIR /tmp
RUN apk add --no-cache wget 
RUN wget --no-cache https://dl.influxdata.com/influxdb/releases/influxdb-${VERSION}-static_linux_amd64.tar.gz -O influxdb.tar.gz
RUN tar xvfz influxdb.tar.gz  -C /bin/influxdb  --strip 2
RUN mkdir /etc/influxdb
RUN mv /bin/influxdb/influxdb.conf /etc/influxdb/
RUN rm -r *
EXPOSE 8086 8088 
CMD ["/bin/influxdb/influxd"]