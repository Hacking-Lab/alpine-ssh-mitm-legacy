FROM hackinglab/alpine-base:3.2 as builder
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

ADD root /

# Install openssh server
RUN apk add --update openssl openssh-server file alpine-sdk gcc g++ libssh-dev argp-standalone git && \
    git clone https://github.com/litheory/ssh-mitm-proxy.git /build && \
    cd /build && \
    gcc *.c -o ssh-proxy -lssh -lpthread -largp && \
    rm -rf /var/cache/apk/*



FROM hackinglab/alpine-base:3.2
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

COPY --from=builder /build/ssh-proxy /usr/bin/ssh-proxy

# Install openssh server
RUN apk add --update openssl openssh-server file alpine-sdk gcc g++ libssh-dev argp-standalone && \
    rm -rf /var/cache/apk/*

# Add the files
ADD root /

# Expose the ports for nginx
EXPOSE 2222
