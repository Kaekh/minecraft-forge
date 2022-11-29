#!/bin/bash

home=${HOME}
url=${FORGE}
firstRun=false

if [ ! -d "$home/server/world" ]; then
	wget --no-cache $url -O "${HOME}/server/forge-${FORGEVERSION}-installer.jar"
  cd "${HOME}/server"
  java -jar ${HOME}/server/forge-${FORGEVERSION}-installer.jar --installServer
  echo "eula=true" > ${HOME}/server/eula.txt
fi

exit 0
