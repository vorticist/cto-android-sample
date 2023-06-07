#FROM androidsdk/android-30
FROM adoptopenjdk:11-jdk-hotspot

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        unzip

ARG ANDROID_SDK_VERSION=30
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip sdk-tools.zip -d android-sdk && \
    rm sdk-tools.zip

RUN mv android-sdk/cmdline-tools/* ./tmp && mkdir android-sdk/cmdline-tools/latest
RUN mv ./tmp/* android-sdk/cmdline-tools/latest/

ENV ANDROID_HOME=android-sdk
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin

RUN yes | sdkmanager --licenses

COPY . /app
WORKDIR /app

RUN ./gradlew assembleDebug
