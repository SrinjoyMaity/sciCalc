FROM openjdk:11
COPY ./target/ScientificCalculator-1.0-SNAPSHOT-jar-with-dependencies.jar ./
WORKDIR ./
CMD ["java", "-jar", "ScientificCalculator-1.0-SNAPSHOT-jar-with-dependencies.jar"]