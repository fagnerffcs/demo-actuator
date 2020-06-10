FROM maven:3.6.1-jdk-8-alpine AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:8-jdk-alpine
COPY --from=build /usr/src/app/target/demo-actuator.jar /usr/app/demo-actuator.jar
WORKDIR /usr/app/
RUN apk add curl
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-jar","/demo-actuator.jar", "--logging.file=/tmp/demo-actuator.log"]