FROM alpine:3.10

MAINTAINER Cormac Cannon "cormacc_public@gmail.com"

ENV PLANTUML_VERSION 1.2020.1
ENV PLANTUML_DIR /usr/share/java/plantuml

RUN sed -i s/v3.10/edge/ /etc/apk/repositories
RUN apk update \
    && apk add ca-certificates emacs git curl \
    && mkdir -p ${PLANTUML_DIR} \
    && curl -L https://sourceforge.net/projects/plantuml/files/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar/download -o ${PLANTUML_DIR}/plantuml.jar \
    && apk del curl

WORKDIR /root

COPY init.el /root/.emacs.d/
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "emacs" ]
