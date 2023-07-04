FROM cimg/android:2023.06.1
# SHELL ["/bin/bash", "-c"]

ENV ANDROID_SDK_HOME=/sdk

RUN yes | sdkmanager --licenses

COPY . /app
WORKDIR /app

RUN ./gradlew assembleDebug
