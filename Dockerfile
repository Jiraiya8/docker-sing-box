FROM --platform=$TARGETPLATFORM alpine:latest AS builder

LABEL email="yourpipi@proton.me"

ARG SING_BOX_VERSION=1.4.1

ARG TARGETOS

ARG TARGETARCH

ARG TARGETVARIANT

ARG NAME=sing-box-${SING_BOX_VERSION}-${TARGETOS}-${TARGETARCH}${TARGETVARIANT}

ARG RELEASE_NAME=${NAME}.tar.gz

RUN set -ex \ 
    && apk update \
    && apk add wget \
    && wget https://github.com/SagerNet/sing-box/releases/download/v${SING_BOX_VERSION}/${RELEASE_NAME} -O ${RELEASE_NAME} \
    && tar -zxvf ${RELEASE_NAME} \
    && mv ./${NAME}/sing-box /usr/local/bin/sing-box

FROM --platform=$TARGETPLATFORM alpine:latest AS dist

COPY --from=builder /usr/local/bin/sing-box /usr/local/bin/

RUN set -ex \
    && chmod +x /usr/local/bin/sing-box \
    && apk update \
    && apk upgrade \
    && apk add bash tzdata ca-certificates \
    && rm -rf /var/cache/apk/*

VOLUME [ "/etc/sing-box/" ]

EXPOSE 2080

ENTRYPOINT [ "/usr/local/bin/sing-box" ]

CMD [ "run", "-c", "/etc/sing-box/config.json" ]
