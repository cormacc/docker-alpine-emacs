FROM openjdk:alpine

# FROM alpine:3.11
# Originally used alpine base and added 'openjdk11-jre' to the apk list below, but that results in a larger image...

MAINTAINER Cormac Cannon "cormacc_public@gmail.com"

ENV LANG en_US.UTF-8
ENV PLANTUML_VERSION 1.2020.1
ENV PLANTUML_DIR /usr/share/java/plantuml

# This upstream change causes emacs launch failure...
# RUN sed -i s/v3.10/edge/ /etc/apk/repositories
# No longer necessary after swithching to 3.11 base above anyway



RUN apk update \
  && apk add --no-cache ca-certificates emacs git curl \
  graphviz ttf-droid ttf-droid-nonlatin \
  && mkdir -p ${PLANTUML_DIR} \
  && curl -L https://sourceforge.net/projects/plantuml/files/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar/download -o ${PLANTUML_DIR}/plantuml.jar \
  && apk del curl

WORKDIR /root

COPY init.el /root/.emacs.d/
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "emacs" ]
