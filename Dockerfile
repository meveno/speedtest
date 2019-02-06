FROM tomcat:7.0
EXPOSE 8080
WORKDIR /usr/local/tomcat
COPY . /usr/local/tomcat/webapps/speedtest

