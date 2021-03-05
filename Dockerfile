FROM tomcat:7.0
MAINTAINER Shivkant
RUN groupadd -r jboss -g 1000
RUN useradd -u 1000 -r -g jboss -s /sbin/nologin -c "JBoss user" jboss
RUN mkdir /home/jboss
RUN chmod -R 757 /usr/local/tomcat/webapps

EXPOSE 8080

USER jboss

COPY ./HelloWeb.war /usr/local/tomcat/webapps/HelloWeb.war

ENTRYPOINT ["sh","/usr/local/tomcat/startTomcat.sh"]
