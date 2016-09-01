FROM jacekmarchwicki/android:latest

ENV JENKINS_URL http://localhost:8080
ENV JENKINS_USER admin
ENV JENKINS_PASSWORD admin
ENV NODE_NAME
ENV NODE_LABEL android

COPY ./bootstrap ./bootstrap

RUN mkdir -p /var/jenkins_slave/

ENTRYPOINT ["sh", "./bootstrap"]

