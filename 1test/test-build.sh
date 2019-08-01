#!/bin/bash

INFO_IMAGE_NAME=dja
INFO_IMAGE_TAG=1.0
INFO_CONTAINER_NAME=dja-cont

# docker rm ${INFO_CONTAINER_NAME}
# old_image=$(docker images | awk '{print $1}' | grep ${INFO_IMAGE_NAME})
# if [[ -n ${old_image} ]];then
#     docker rmi ${INFO_IMAGE_NAME}
# fi


docker build -t ${INFO_IMAGE_NAME}:${INFO_IMAGE_TAG} .
if [ $? -ne 0 ]; then
    echo "build error!"
    exit 1
fi
docker run --name ${INFO_CONTAINER_NAME} ${INFO_IMAGE_NAME}:${INFO_IMAGE_TAG}