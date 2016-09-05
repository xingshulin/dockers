FROM daocloud.io/hycf555/android:master-bf0a8c8

ENV JENKINS_URL http://localhost:8080
ENV JENKINS_USER admin
ENV JENKINS_PASSWORD admin
ENV NODE_NAME ''
ENV NODE_LABEL android

COPY ./bootstrap ./bootstrap

RUN mkdir -p /var/jenkins_slave/

ENTRYPOINT ["sh", "./bootstrap"]

