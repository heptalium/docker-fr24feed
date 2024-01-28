FROM alpine AS arch_amd64
ARG ARCH=amd64
ARG DIR=linux_binaries

FROM alpine AS arch_386
ARG ARCH=i386
ARG DIR=linux_binaries

FROM alpine AS arch_arm64
ARG ARCH=arm64
ARG DIR=rpi_binaries

FROM alpine AS arch_arm
ARG ARCH=armhf
ARG DIR=rpi_binaries

FROM arch_$TARGETARCH
RUN apk add --no-cache bash
ARG FILE=fr24feed_1.0.46-1_$ARCH.tgz
RUN wget https://repo-feed.flightradar24.com/$DIR/$FILE && tar xf $FILE --strip-components=1 -C /usr/bin fr24feed_$ARCH/fr24feed && rm -f $FILE
CMD ["/usr/bin/fr24feed"]
EXPOSE 8754
