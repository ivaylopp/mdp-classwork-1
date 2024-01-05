FROM maven:3.9.6-amazoncorretto-17@sha256:854067018253a2162372ea79d336541e6800c1b3deba68d7855a0c39ee6852d0 AS build

WORKDIR /project
COPY . /project
RUN mvn clean package


FROM amazoncorretto:17-alpine-jre@sha256:ed14b8c2f00dbb7b94446aa01d00583976ff0eda2577f5474035f3b4cf078dfd

COPY --from=build /project/target/example-project-0.0.1-SNAPSHOT.jar /

ENTRYPOINT exec java "$JAVA_OPTIONS" -jar /example-project-0.0.1-SNAPSHOT.jar
