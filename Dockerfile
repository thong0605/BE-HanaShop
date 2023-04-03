#
# Build stage
#
FROM maven:3.8.2-jdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:11-jdk-slim
COPY --from=build /target/hanashop-0.0.1-SNAPSHOT.jar hanashop.jar
#ARG JAR_FILE=target/hanashop-0.0.1-SNAPSHOT.jar
#ADD ${JAR_FILE} hanashop.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","hanashop.jar"]