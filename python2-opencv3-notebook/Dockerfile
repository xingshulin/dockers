FROM daocloud.io/hycf555/python2-opencv3:master-d47fa11

RUN pip install jupyter

ENV PORT=8888

ENTRYPOINT ["bash", "-c", "jupyter notebook --port ${PORT}"]
