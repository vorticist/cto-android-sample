FROM androidsdk/android-30
# FROM debian:bookworm

RUN apt-get update && \
     apt-get install -y --no-install-recommends curl unzip openjdk-17-jdk openjdk-17-jre \

ENV JAVA_HOME=/usr/lib/jvm/jdk-17/
ENV PATH=\$PATH:\$JAVA_HOME/bin

RUN yes | sdkmanager --licenses

COPY . /app
WORKDIR /app

RUN ./gradlew assembleDebug
