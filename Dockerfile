FROM jenkins/jenkins:lts

USER root

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV CASC_JENKINS_CONFIG /var/jenkins_home/innuendo.yml

COPY job_dsl.groovy .

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

RUN apt-get update

RUN apt-get -y install make

RUN apt-get -y install gcc

RUN apt-get -y install python

RUN apt-get -y install pip

COPY innuendo.yml /var/jenkins_home/innuendo.yml

USER jenkins