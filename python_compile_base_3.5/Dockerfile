FROM python:3.5-alpine3.8
#FROM alpine:3.8 
#as builder

MAINTAINER both "yiruiduan@126.com"


RUN set -ex \
&& echo https://mirrors.ustc.edu.cn/alpine/v3.8/main > /etc/apk/repositories \
&& echo https://mirrors.ustc.edu.cn/alpine/v3.8/community >> /etc/apk/repositories \
&& apk add  gcc make musl-dev g++ linux-headers  \
&& pip3  install -i https://pypi.tuna.tsinghua.edu.cn/simple  cython\
&& rm -rf /root/.cache/

WORKDIR /compile

