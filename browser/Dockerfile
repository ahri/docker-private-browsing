FROM alpine:3.2

RUN apk add --update iptables=1.4.21-r3 \
        ttf-liberation=2.00.1-r0 ttf-linux-libertine-doc=5.3.0-r0 ttf-droid=20110607-r0 ttf-linux-libertine=5.3.0-r0 ttf-ubuntu-font-family=0.80-r0 ttf-dejavu=2.34-r0 ttf-freefont=20120503-r0 \
        font-misc-cyrillic=1.0.0-r2 font-misc-ethiopic=1.0.3-r0 font-misc-misc=1.0.0-r3 font-misc-meltho=1.0.1-r1 && \
    rm -rf /var/cache/apk/*

RUN apk add --update firefox=38.3.0-r0 dbus=1.8.16-r1 && \
    rm -rf /var/cache/apk/*

ADD browser.sh /
ADD profile /profile
RUN mkdir /downloads

VOLUME /downloads

ENTRYPOINT ["/browser.sh"]
CMD ["1000", "1000"]
