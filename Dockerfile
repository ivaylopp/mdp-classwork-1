# Build stage
FROM container-registry.oracle.com/graalvm/native-image:17-ol8 AS build

WORKDIR /app
COPY ./mvnw ./.mvn pom.xml /app
RUN ./mvnw dependency:resolve

COPY . /app
RUN ./mvnw -Pnative native:compile --no-transfer-progress

# Run stage
FROM scratch

COPY --from=build /app/target/example-project /spring-boot-application
ENTRYPOINT ["/spring-boot-application"]
