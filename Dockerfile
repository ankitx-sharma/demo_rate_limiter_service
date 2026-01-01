# --------------- Build stage --------------

FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Cache dependencies first
COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline

# Build
COPY src ./src
RUN mvn -q -DskipTests clean package

# --------------- Run stage --------------
FROM eclipse-temurin:17-jre
WORKDIR /app

# Optional: run as non-root
RUN useradd -m appuser
USER appuser

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENV JAVA_OPTS=""

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app/app.jar" ]