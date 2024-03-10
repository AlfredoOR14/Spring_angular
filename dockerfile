FROM openjdk:21-slim
COPY target/*.jar  inventario-app.jar
ENTRYPOINT ["java","-jar","/inventario-app.jar"]