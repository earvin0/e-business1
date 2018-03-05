FROM ubuntu

ENV SCALA_VERSION 2.12.4

RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get install -y software-properties-common

RUN add-apt-repository ppa:webupd8team/java

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

RUN apt-get update

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get install -y oracle-java8-installer
RUN apt-get install -y sbt
RUN apt-get install -y scala 

ADD slick-3.2.2.tar.gz /opt
ADD typesafe-activator-1.3.12.zip /opt
WORKDIR /opt
RUN apt-get install zip unzip
RUN unzip -a typesafe-activator-1.3.12.zip
RUN rm typesafe-activator-1.3.12.zip
ENV PATH /opt/activator-dist-1.3.12/bin:$PATH

#RUN sbt --version
#RUN sbt







