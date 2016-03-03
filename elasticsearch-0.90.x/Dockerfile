FROM yaronr/openjdk-7-jre
MAINTAINER Jorge Sá Pereira "jorgesapereira@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elasticsearch.org/elasticsearch/0.90/debian stable main" >>/etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y elasticsearch

EXPOSE 9200 9300
CMD ["/usr/share/elasticsearch/bin/elasticsearch","-f"]
