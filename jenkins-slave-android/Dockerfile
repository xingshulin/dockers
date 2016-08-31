FROM jacekmarchwicki/android:latest

ENV JENKINS_URL http://localhost:8080
ENV JENKINS_USER admin
ENV JENKINS_PASSWORD admin
ENV NODE_NAME hostname
ENV NODE_LABEL android

RUN mkdir -p /var/jenkins_slave/

ENTRYPOINT ["sh", "./bootstrap"]

