FROM maven:3.9.11-eclipse-temurin-21 AS builder
WORKDIR /build
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
RUN --mount=type=cache,target=/root/.m2 \
    mvn dependency:go-offline
COPY src src
RUN --mount=type=cache,target=/root/.m2 \
    mvn clean package -DskipTests

FROM eclipse-temurin:21-jre
LABEL org.opencontainers.image.title="portfolio"
LABEL org.opencontainers.image.description="Portfolio API"
LABEL org.opencontainers.image.vendor="TecSmartApp"
RUN groupadd --system spring \
    && useradd \
        --system \
        --gid spring \
        --create-home \
        --shell /usr/sbin/nologin \
        spring

WORKDIR /app
COPY --from=builder \
     --chown=spring:spring \
     /build/target/*.jar \
     app.jar

USER spring:spring
EXPOSE 8080
ENTRYPOINT ["java"]
CMD [ "-XX:MaxRAMPercentage=75", "-XX:+ExitOnOutOfMemoryError", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]