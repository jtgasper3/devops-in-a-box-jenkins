FROM jenkins/jenkins:lts-alpine

USER root

RUN apk update && apk upgrade \
    && apk add --no-cache bash git openssh

USER jenkins

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
 
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
COPY configureOpenJDKInstaller.groovy /usr/share/jenkins/ref/init.groovy.d/configureOpenJDKInstaller.groovy
 
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
