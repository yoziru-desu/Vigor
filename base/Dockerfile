FROM debian:8
MAINTAINER Arnau Siches <asiches@gmail.com>

COPY bootstrap.sh /usr/local/bin/bootstrap
RUN /usr/local/bin/bootstrap

ENV LANG en_US.UTF-8
ENV TERM screen-256color

COPY sections /root/.vim/sections

CMD ["vim"]
