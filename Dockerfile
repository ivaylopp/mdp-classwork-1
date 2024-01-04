FROM maven:3.9.6-amazoncorretto-17 AS build

COPY . /project

WORKDIR /project

RUN mvn clean package


FROM amazoncorretto:17-alpine-jdk

COPY --from=build target/application.jar /

ENTRYPOINT exec java "$JAVA_OPTIONS" -jar /application.jar
