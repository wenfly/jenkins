FROM jenkins
# if we want to install via apt
USER root
RUN apt-get update && apt-get install -y  python3.7 \
&& cd /usr/share/jenkins \
&& rm -r jenkins.war \
&& wget http://mirrors.jenkins.io/war/latest/jenkins.war
USER jenkins
