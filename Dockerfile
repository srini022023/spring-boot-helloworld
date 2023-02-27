#
# Build stage
#

FROM maven:3.6.3-jdk-11-slim AS build

WORKDIR /usr/src/app

COPY . ./

RUN mvn clean package -DskipTests

#
# Package stage
#

FROM openjdk:11-jre-slim

ARG JAR_NAME="spring-boot-helloworld"

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/target/spring-boot-helloworld-0.0.1-SNAPSHOT.jar ./app.jar



CMD ["java","-jar", "./app.jar"]
