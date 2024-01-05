FROM ghcr.io/graalvm/jdk-community:21.0.1-ol7-20231024@sha256:32280e9cb6e4dd0283f9079385d40d0bce9775074c44ba16db7a87de23dc5327 AS build

WORKDIR /project
COPY . /project
RUN mvn -Pnative native:compile


FROM amazoncorretto:17-alpine-jre@sha256:ed14b8c2f00dbb7b94446aa01d00583976ff0eda2577f5474035f3b4cf078dfd

COPY --from=build /project/target/example-project-0.0.1-SNAPSHOT.jar /

ENTRYPOINT exec java "$JAVA_OPTIONS" -jar /example-project-0.0.1-SNAPSHOT.jar
