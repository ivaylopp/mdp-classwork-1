FROM maven:amazoncorretto AS build

RUN mvn clean package

FROM amazoncorretto:17-alpine-jdk

COPY --from=build target/application.jar /

ENTRYPOINT exec java "$JAVA_OPTIONS" -jar /application.jar
