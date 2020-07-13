FROM ubuntu

MAINTAINER lakkumanan s

RUN apt-get clean

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y openjdk-8-jdk

RUN mkdir -p /usr/bin/local/tomcat

RUN apt-get install -y wget

WORKDIR /usr/bin/local/tomcat

RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.56/bin/apache-tomcat-8.5.56.tar.gz

RUN tar -xvzf apache-tomcat-8.5.56.tar.gz

RUN wget https://dev.azure.com/lakkumanan23/_apis/resources/Containers/7329662/drop?itemPath=drop%2Ftarget%2Fhello-world-war-1.0.0.war

ADD drop/target/hello-world-war-1.0.0.war /usr/bin/local/tomcat/apache-tomcat-8.5.56/webapps

EXPOSE 8080

RUN chmod +x /usr/bin/local/tomcat/apache-tomcat-8.5.56/bin/catalina.sh

CMD /usr/bin/local/tomcat/apache-tomcat-8.5.56/bin/catalina.sh run
