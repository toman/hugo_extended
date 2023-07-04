ARG NODE_VERSION

FROM node:$NODE_VERSION

ARG HUGO_VERSION=0.115.1
ARG HUGO_PLATFORM=Linux-64bit

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_${HUGO_PLATFORM}.tar.gz && \
    tar -xf hugo_extended_${HUGO_VERSION}_${HUGO_PLATFORM}.tar.gz -C /usr/local/bin && \
    hugo version && rm hugo_extended_${HUGO_VERSION}_${HUGO_PLATFORM}.tar.gz
    
RUN wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash