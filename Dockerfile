# Build stage
FROM container-registry.oracle.com/graalvm/native-image:17-ol8 AS build

WORKDIR /build-ctx
COPY .mvn /build-ctx/.mvn
COPY mvnw pom.xml /build-ctx
RUN ./mvnw dependency:resolve

COPY . /build-ctx
RUN ./mvnw -Pnative native:compile --no-transfer-progress

# Run stage
FROM scratch

COPY --from=build /build-ctx/target/example-project /spring-boot-application
ENTRYPOINT ["/spring-boot-application"]
