FROM openjdk:17-jdk-alpine

RUN mvn clean packagegst

COPY target/application.jar /

ENTRYPOINT exec java "$JAVA_OPTIONS" -jar /application.jar
