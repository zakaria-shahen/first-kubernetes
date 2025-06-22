#!/bin/bash

echo "clone mooc microservice project"
git clone https://github.com/zakaria-shahen/mooc-spring-java

# upgrade to spring boot 3.2.12
rm mooc-spring-java/pom.xml
cp pom.xml mooc-spring-java/pom.xml

echo "IMPORTANT: make sure to set JAVA_HOME to Java 21 LTS"
 ./mooc-spring-java/mvnw clean spring-boot:build-image -DskipTests -Dspring-boot.run.jvmArguments="--enable-preview"