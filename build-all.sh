#!/bin/bash

COMP_DIR=components

if [ -e ${COMP_DIR} ]
then
  rm -fr ${COMP_DIR}
fi

mkdir ${COMP_DIR}
TOP=`pwd`
cd ${COMP_DIR}

COMPS='database
       backend
       frontend'

for comp in ${COMPS}
do
  cd ${TOP}/${COMP_DIR}

  echo "//////////////// ${comp} ////////////////////"

  git clone https://github.com/manleyot/cookbook-${comp}.git

  cd cookbook-${comp}

  docker build -t manleyot/cookbook-${comp} .

done

docker images | grep manleyot
