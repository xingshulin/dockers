FROM python:2.7

MAINTAINER Qin Han "qinhan@xingshulin.com"

RUN pip install numpy

COPY ./scripts/install-opencv-linux.sh ./install-opencv-linux.sh

RUN sh install-opencv-linux.sh
