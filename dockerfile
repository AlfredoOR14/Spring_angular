FROM openjdk:21-slim

RUN mkdir -p /opt/app

WORKDIR /opt/app

COPY .mvn/ .mvn

COPY mvnw pom.xml ./

RUN chmod +x mvnw

RUN ./mvnw dependency:go-offline

COPY ./src ./src

RUN ./mvnw clean install -Dmaven.test.skip=true

RUN mv target/*.jar ./inventario-app.jar   

RUN ls
RUN pwd 

ENTRYPOINT ["java","-jar","/opt/app/inventario-app.jar"]

