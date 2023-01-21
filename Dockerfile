FROM arm32v7/alpine
RUN apk add --no-cache bash
ARG FILE=fr24feed_1.0.34-0_armhf.tgz
RUN wget https://repo-feed.flightradar24.com/rpi_binaries/$FILE && tar xf $FILE --strip-components=1 -C /usr/bin fr24feed_armhf/fr24feed && rm -f $FILE
CMD ["/usr/bin/fr24feed"]
EXPOSE 8754
