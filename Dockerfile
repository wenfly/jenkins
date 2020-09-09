FROM jenkins
# if we want to install via apt
USER root
RUN apt-get update \
&& apt-get install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev make \
&& wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tgz \
&& tar -zxf Python-3.7.1.tgz -C /tmp/ \
&& /tmp/Python-3.7.1 \
&& ./configure --enable-optimizations \
&& make -j 8 \
&& make altinstall \
&& cd /usr/share/jenkins \
&& rm -r jenkins.war \
&& wget http://mirrors.jenkins.io/war/latest/jenkins.war
USER jenkins
