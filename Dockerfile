FROM hackinglab/alpine-base-hl:3.2 AS builder
LABEL maintainer="Ivan Buetler <ivan.buetler@hacking-lab.com>"

# Install openssh server
RUN apk add --update openssl openssh-server file alpine-sdk gcc g++ libssh-dev argp-standalone git && \
    git clone https://github.com/litheory/ssh-mitm-proxy.git /build && \
    cd /build && \
    gcc *.c -o ssh-proxy -lssh -lpthread -largp && \
    rm -rf /var/cache/apk/*



FROM hackinglab/alpine-base-hl:3.2
LABEL maintainer="Ivan Buetler <ivan.buetler@hacking-lab.com>"

COPY --from=builder /build/ssh-proxy /usr/bin/ssh-proxy
COPY --from=builder /usr/lib/libssh.so.4 /usr/lib/libssh.so.4

# Install openssh server
RUN apk add --update openssl openssh openssh-server file && \
    rm -rf /var/cache/apk/*

# Add the files
ADD root /

# Expose the ports for ssh proxy
EXPOSE 2222
