#!/bin/bash

echo "clone mooc microservice project"
git clone https://github.com/zakaria-shahen/mooc-spring-java

echo "Running OracleDB and redis by docker compose..."
docker compose up -f mooc-spring-java/docker-compose.yml -d

# upgrade to spring boot 3.2.12
rm mooc-spring-java/pom.xml
cp pom.xml mooc-spring-java/pom.xml

echo "IMPORTANT: make sure to set JAVA_HOME to Java 21 LTS"
 ./mooc-spring-java/mvnw clean spring-boot:build-image -DskipTests -Dspring-boot.run.jvmArguments="--enable-preview"


echo "loading docker image into minikube.."
echo "  if minikube image load not working, use next commands"
echo "  docker image save -o image.tar mooc:0.0.1-SNAPSHOT"
echo "  minikube image load image.tar"
minikube image load mooc:0.0.1-SNAPSHOT