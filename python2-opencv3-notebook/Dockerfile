FROM daocloud.io/hycf555/python2-opencv3:master-d47fa11

RUN pip install jupyter

ENV PORT=8888

EXPOSE $PORT

ENTRYPOINT ["bash", "-c", "jupyter notebook --ip 0.0.0.0 --port ${PORT} --no-browser"]
