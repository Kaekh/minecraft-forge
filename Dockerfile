###########################################################
# Dockerfile that builds a Minecraft forge server
###########################################################
FROM ubuntu:20.04

ENV FORGEVERSION 1.18.2-40.1.54
ENV FORGE https://maven.minecraftforge.net/net/minecraftforge/forge/${FORGEVERSION}/forge-${FORGEVERSION}-installer.jar
ENV HOME "/minecraft"
ENV MINMEN 4G
ENV MAXMEN 8G

RUN set -x \
        # Install, update & upgrade packages
                && apt-get update \
        && apt-get install -y --no-install-recommends --no-install-suggests \
                openjdk-17-jre-headless \
                software-properties-common \
                wget \
                vim \
                && mkdir -p ${HOME}/server \
        && wget --no-cache --max-redirect=30 "https://raw.githubusercontent.com/Kaekh/minecraft-forge/main/scripts/installer.sh" -O "/root/installer.sh" \
        && chmod +x /root/installer.sh

RUN bash /root/installer.sh \
        && chmod +x /${HOME}/server/run.sh

RUN echo -Xms${MINMEN} > ${HOME}/server/user_jvm_args.txt \
        && echo Xmx${MAXMEN} >> ${HOME}/server/user_jvm_args.txt

WORKDIR ${HOME}/server

CMD ["bash", "run.sh"]
