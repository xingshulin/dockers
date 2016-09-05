FROM ubuntu:14.04

MAINTAINER Qin Han "qinhan@xingshulin.com"

# Install java8
RUN apt-get update && apt-get install -y software-properties-common && apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN add-apt-repository -y ppa:webupd8team/java
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get update && apt-get install -y oracle-java8-installer && apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Deps
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python curl && apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Android SDK
# Notes -> https://code.google.com/p/android/issues/detail?id=183131&q=subcomponent%3DTools-sdkman%20-has%3Adefect%20label%3Areportedby-developer&colspec=ID%20Status%20Priority%20Owner%20Summary%20Stars%20Reporter%20Opened
RUN cd /opt && \
	wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
    tar xzf android-sdk_r24.4.1-linux.tgz && \
    rm android-sdk_r24.4.1-linux.tgz && \
    (echo y | android-sdk-linux/tools/android -s update sdk --no-ui --filter platform-tools,tools -a ) && \
    (echo y | android-sdk-linux/tools/android -s update sdk --no-ui --filter extra-android-m2repository,extra-android-support,extra-google-google_play_services,extra-google-m2repository -a) && \
    (echo y | android-sdk-linux/tools/android -s update sdk --no-ui --filter build-tools-23.0.3,android-24,android-23,android-22,android-21 -a)

# Setup environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN which adb
RUN which android

# Cleaning
RUN apt-get clean

# GO to workspace
RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace
