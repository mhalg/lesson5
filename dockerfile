FROM ubuntu:latest
#VOLUME /tmp
RUN apt-get update && apt-get install -y default-jdk maven git tomcat9 && cd /tmp && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && cd boxfuse-sample-java-war-hello && mvn package && cp target/*.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD export CATALINA_HOME=/usr/share/tomcat9 && export CATALINA_BASE=/var/lib/tomcat9 && export CATALINA_TMPDIR=/tmp && export JAVA_OPTS="-Djava.awt.headless=true" && cd $CATALINA_BASE && exec /usr/share/tomcat9/bin/catalina.sh run