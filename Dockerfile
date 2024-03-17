FROM maven:3.9.5-eclipse-temurin-21 as builder

WORKDIR /app

COPY pom.xml .

RUN mvn -e -B dependency:resolve

COPY src ./src

RUN mvn -e -B package -DskipTests


FROM openjdk:21-jdk-slim

WORKDIR /app

COPY --from=builder app/target/*.jar ./inventario-app.jar

EXPOSE 8081

CMD ["java","-jar","inventario-app.jar"]

# RUN ./mvnw dependency:go-offline
# ./mvnw clean install -Dmaven.test.skip=true

# RUN mv target/*.jar ./inventario-app.jar   

# ENTRYPOINT ["java","-jar","/opt/app/inventario-app.jar"]

