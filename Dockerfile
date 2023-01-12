#
# Build stage
#
FROM maven:3.5.0-jdk-1.8 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:8
COPY --from=build /target/dh-docker.jar dh-docker.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","dh-docker.jar"]
