FROM quay.io/cprakash2118/april-java-unzip-httpd-image-02
MAINTAINER nived <abcd@abcd>
USER root
RUN mkdir -p /opt/jboss
COPY jboss.zip /opt/jboss/jboss.zip
RUN unzip /opt/jboss/jboss.zip -d /opt/jboss
RUN rm -rf /opt/jboss/jboss.zip
ENV JBOSS_HOME /opt/jboss/jboss-eap-7.4
RUN chown -R jboss:jboss /opt/ && chown -R 755 /opt/
CMD ["${JBOSS_HOME}/bin/add-user.sh admin redhat123!"]
ENV LAUNCH_JBOSS_IN_BACKGROUND true
EXPOSE 8080 9999 9990
#CMD ["${JBOSS_HOME}/bin/add-user.sh admin redhat123!"]
CMD ["/opt/jboss/jboss-eap-7.4/bin/standalone.sh", "-b", "0.0.0.0"]
