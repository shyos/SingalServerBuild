FROM ubuntu:15.10

MAINTAINER Jani Monoses <jani@ubuntu.com>

RUN apt-get update && \
  apt-get install -y redis-server postgresql \
  python-software-properties supervisor software-properties-common sudo

RUN add-apt-repository -y ppa:webupd8team/java

RUN echo "oracle-java7-unlimited-jce-policy shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections

RUN apt-get update && apt-get install -y oracle-java7-unlimited-jce-policy git maven

RUN adduser --disabled-password --quiet --gecos Whisper whisper
ENV HOME /home/whisper
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
WORKDIR /home/whisper

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config /home/whisper/
COPY jar/ /home/whisper/
COPY run-server.sh /home/whisper

RUN /etc/init.d/postgresql start && \
 sudo -u postgres psql --command "CREATE USER whisper WITH SUPERUSER PASSWORD 'whisper';" && \
 sudo -u postgres createdb -O whisper accountdb && \
 sudo -u postgres createdb -O whisper messagedb

EXPOSE 8080 8081

VOLUME /home/whisper/config
VOLUME /home/whisper/certs

CMD ./run-server.sh
