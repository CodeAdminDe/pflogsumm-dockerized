FROM ubuntu:latest

MAINTAINER Frederic Habich <frederic.habich@codeadmin.de>

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /usr/local

RUN apt-get update && apt-get install wget -y && wget http://jimsun.linxnet.com/downloads/pflogsumm-1.1.3.tar.gz && \
    tar -xzf pflogsumm-1.1.3.tar.gz && mv pflogsumm-1.1.3 pflogsumm && rm pflogsumm-1.1.3.tar.gz && \
    chmod +x pflogsumm/pflogsumm.pl

COPY ./run.sh .

RUN chmod +x ./run.sh

VOLUME ["/maillog"]

ENTRYPOINT ["/bin/bash", "run.sh"]

CMD ["-d today /maillog/mail.log"]