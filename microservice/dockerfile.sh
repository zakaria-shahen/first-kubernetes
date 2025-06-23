#!/bin/bash

cd microservice || exit 1
if [ ! -d "mooc-spring-java" ]; then
    echo "clone mooc microservice project..."
    git clone https://github.com/zakaria-shahen/mooc-spring-java || { exit 1; }
    # upgrade to spring boot 3.2.12
    rm mooc-spring-java/pom.xml
    cp pom.xml_ mooc-spring-java/pom.xml
else
    echo "The folder 'mooc-spring-java' already exists."
fi

echo "Running OracleDB and redis by docker compose..."
docker compose -f mooc-spring-java/docker-compose.yml up -d || { exit 1; }


if [[ "$JAVA_HOME" == *"21"* ]]; then
    echo "JAVA_HOME version 21."
else
    echo "ERROR: JAVA_HOME does not contain version 21."
    ecit 1;
fi

cd mooc-spring-java || { echo "mooc-spring-java folder not found!"; exit 1; }
./mvnw clean spring-boot:build-image -DskipTests -Dspring-boot.run.jvmArguments="--enable-preview" || exit 1
cd ../../

docker tag mooc:0.0.1-SNAPSHOT ghcr.io/zakaria-shahen/first-kubernetes:main

echo "Loading docker image into Minikube by Minikube.."
minikube image load ghcr.io/zakaria-shahen/first-kubernetes:main || {
  echo -e "fail to load image by Minikube\nLoading docker image into minikube by tar file.." \
  && echo docker image save -o ghcr.io/zakaria-shahen/first-kubernetes:main  \
  && minikube image load image.tar;
}