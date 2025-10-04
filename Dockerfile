# =========================
# 1. Build stage
# =========================
FROM maven:3.8.4-openjdk-17 AS build

# Set working directory
WORKDIR /wins/java-spring-mvc

# Copy pom.xml and source code
COPY pom.xml /wins/java-spring-mvc
COPY src /wins/java-spring-mvc/src

# Build application (skip tests)
RUN mvn clean package -DskipTests

# =========================
# 2. Runtime stage
# =========================
FROM openjdk:17-slim

WORKDIR /wins/java-spring-mvc

# Copy war file từ build stage sang
COPY --from=build /wins/java-spring-mvc/target/*.war /wins/java-spring-mvc/app.war

# Expose port
EXPOSE 8080

# Run Spring Boot app
ENTRYPOINT ["java", "-jar", "/wins/java-spring-mvc/app.war"]
