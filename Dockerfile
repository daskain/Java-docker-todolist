FROM maven:3.6.3-jdk-11-slim

ENV LOG_LEVEL=DEBUG
ENV SKIP_TEST=true

COPY . /tmp/code/
WORKDIR /tmp/code/

RUN mvn clean --batch-mode --no-transfer-progress; \
	mvn package -DskipTests --batch-mode --mo-transfer-progress

RUN mkdir /code/; cp /tmp/code/target/todolist/todolist-1.jar /code/.

WORKDIR /code/
ENTRYPOINT ["java", "-jar", "todolist-1.jar"]