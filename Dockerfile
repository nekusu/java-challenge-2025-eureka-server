FROM maven:3-eclipse-temurin-21-alpine AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-alpine
WORKDIR /app
COPY --from=builder /app/target/eureka-server-*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
