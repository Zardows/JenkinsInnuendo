FROM jenkins/jenkins:lts

USER root

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV CASC_JENKINS_CONFIG /var/jenkins_home/innuendo.yml

COPY job_dsl.groovy .

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

COPY innuendo.yml /var/jenkins_home/innuendo.yml

USER jenkins
