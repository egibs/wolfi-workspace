FROM cgr.dev/chainguard/wolfi-base@sha256:c9339087a6de501ba6989756aeb1e1c89af82ac0e53c8b1ccd1feb44ec2246d9 as WORKSPACE

ENV TERM='xterm-256color'
ENV PS1='\e[92m\u\e[0m@\e[94m\h\e[0m:\e[35m\w\e[0m# '

ARG BASH_VERSION=5.2.21
ARG GO_VERSION=1.21
ARG OPENSSL_VERSION=3.3.1
ARG SUDO_VERSION=1.9.15
ARG USER=wolfi
ARG VIM_VERSION=9.1
ARG YARA_VERSION=4.5.1

RUN apk update \
    && apk add --no-cache \
    bash~${BASH_VERSION} \
    go~${GO_VERSION} \
    openssl~${OPENSSL_VERSION} \
    openssl-dev~${OPENSSL_VERSION} \
    sudo~${SUDO_VERSION} \
    vim~${VIM_VERSION} \
    yara~${YARA_VERSION} \
    yara-dev~${YARA_VERSION} \
    && rm -rf /var/cache/apk/*

RUN echo '%wheel ALL=(ALL) NOPASSWD:/sbin/apk,/usr/bin/vim' > /etc/sudoers.d/wheel \
    && adduser -SD ${USER} ${USER} \
    && adduser ${USER} wheel

USER ${USER}

VOLUME /tmp
VOLUME /run
VOLUME /var/log

ENTRYPOINT [ "/bin/bash" ]
