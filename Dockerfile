FROM ubuntu:18.04

ENV REPO https://github.com/xmrig/xmrig-proxy.git

RUN apt-get update && apt-get install \
    -qq -y --no-install-recommends \
    git ca-certificates build-essential cmake \
    libuv1-dev uuid-dev libmicrohttpd-dev libssl-dev
    
RUN git clone ${REPO}
RUN cd xmrig-proxy && cmake . \
 && make && cp xmrig-proxy /usr/local/bin/
 
ENTRYPOINT ["/urs/local/bin/xmrig-proxy"]
