FROM tomcat:8-jre8
MAINTAINER Chris Montes <chris@sapho.com>

ENV SAPHO_DB_HOSTNAME molly.cz8pxlj4f6sc.us-east-1.rds.amazonaws.com:3306
ENV SAPHO_DB_PASSWORD p244w0rd
ENV SAPHO_DB_PORT 3306
ENV SAPHO_DB_TYPE mysql
ENV SAPHO_DB_NAME sapho
ENV SAPHO_DB_USERNAME root
ENV SAPHO_START_IF_DOWNGRADED false
ENV SAPHO_DEV_MODE false
ENV JAVA_OPTS "-Xmx1g"
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR /root
COPY target/sapho.war /root
COPY nginx.crt /etc/ssl/certs
COPY nginx.key /etc/ssl/certs
COPY launch.sh ${CATALINA_HOME}/bin/

RUN echo GMT > /etc/timezone
RUN chmod +x ${CATALINA_HOME}/bin/launch.sh
CMD ["launch.sh"]
