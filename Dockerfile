FROM eclipse-temurin:21-jdk-jammy AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

COPY pom.xml .
RUN mvn dependency:go-offline -q

COPY src ./src
RUN mvn clean package -DskipTests -q

FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

COPY --from=builder /app/target/shop-management-backend-1.0.0.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
