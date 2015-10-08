FROM alpine:edge

RUN echo "`sed 's,main,testing,' /etc/apk/repositories`" >> /etc/apk/repositories && \
    apk add --update tor=0.2.6.10-r0 && \
    rm -rf tor-0.2.6.10 /var/cache/apk/*

#    apk add --update build-base=0.4-r0 openssl=1.0.2d-r0 libevent-dev=2.0.22-r0 openssl-dev=1.0.2d-r0 && \
#    wget -O - https://www.torproject.org/dist/tor-0.2.6.10.tar.gz | tar zx && \
#    cd tor-0.2.6.10 && ./configure && make install && cd / && \
#    apk del build-base openssl-dev && \

ADD torrc /torrc

EXPOSE 9100

USER nobody
ENV HOME /tmp
ENTRYPOINT ["tor", "-f", "/torrc"]
