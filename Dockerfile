FROM container-registry.oracle.com/graalvm/native-image:17-ol8 AS build

WORKDIR /app
COPY . /app
RUN ./mvnw -Pnative native:compile --no-transfer-progress


FROM scratch

COPY --from=build /app/target/example-project /spring-boot-application
ENTRYPOINT ["/spring-boot-application"]
