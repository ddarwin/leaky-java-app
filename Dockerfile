FROM openjdk:17
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY leaky-java-app.jar leakyjavaapp.jar
EXPOSE 5032
ENTRYPOINT exec java $JAVA_OPTS -jar leakyjavaapp.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar leakyjavaapp.jar
