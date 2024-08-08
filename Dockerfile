FROM cgr.dev/chainguard/wolfi-base@sha256:1c7fcbc7d67145b82f8d393eabf43cf12a14e3759f2e42c8cb61799550909a08 as WORKSPACE

ENV TERM='xterm-256color'
ENV PS1='\e[92m\u\e[0m@\e[94m\h\e[0m:\e[35m\w\e[0m# '

ARG BASH_VERSION=5.2.21
ARG CA_CERTS_VERSION=20240705
ARG DIR=workspace
ARG GIT_VERSION=2.45.2
ARG GO_VERSION=1.21
ARG OPENSSL_VERSION=3.3.1
ARG SUDO_VERSION=1.9.15
ARG USER=wolfi
ARG USER_GID=1000
ARG USER_UID=1000
ARG TINI_VERSION=0.19.0
ARG VIM_VERSION=9.1
ARG YARA_VERSION=4.5.1

RUN apk update \
    && apk add --no-cache \
    bash~${BASH_VERSION} \
    ca-certificates~${CA_CERTS_VERSION} \
    git~${GIT_VERSION} \
    go~${GO_VERSION} \
    openssl~${OPENSSL_VERSION} \
    openssl-dev~${OPENSSL_VERSION} \
    sudo~${SUDO_VERSION} \
    tini~${TINI_VERSION} \
    vim~${VIM_VERSION} \
    yara~${YARA_VERSION} \
    yara-dev~${YARA_VERSION} \
    && rm -rf /var/cache/apk/*

RUN addgroup -g ${USER_GID} ${USER} && \
    adduser -D -u ${USER_UID} -G ${USER} ${USER} && \
    echo "${USER} ALL=(ALL) NOPASSWD:/usr/bin/apk,/usr/bin/vim" > /etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER}

RUN mkdir -p /home/${USER}/.ssh && \
    chmod 700 /home/${USER}/.ssh && \
    chown -R ${USER}:${USER} /home/${USER}/.ssh

RUN mkdir -p /${DIR} && \
    chown ${USER}:${USER} /${DIR}

USER ${USER}

ENV GOPATH=/home/${USER}/go
ENV PATH=$PATH:$GOPATH/bin

WORKDIR /${DIR}

VOLUME /tmp

ENTRYPOINT ["/sbin/tini", "--"]

CMD [ "/bin/bash" ]
