FROM ghcr.io/graalvm/jdk-community:21.0.1-ol7-20231024@sha256:32280e9cb6e4dd0283f9079385d40d0bce9775074c44ba16db7a87de23dc5327 AS build

WORKDIR /app
COPY . /app
RUN ./mvnw -Pnative native:compile --no-transfer-progress


FROM scratch

COPY --from=build /app/target/example-project-0.0.1-SNAPSHOT /spring-boot-application

ENTRYPOINT ["/spring-boot-application"]
