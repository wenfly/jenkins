FROM jenkins
# if we want to install via apt
USER root
RUN apt-get update \
&& apt-get install -yq --no-install-recommends build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev make \
&& wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tgz \
&& tar -zxf Python-3.7.1.tgz -C /tmp/ \
&& rm -r Python-3.7.1.tgz \
&& cd /tmp/Python-3.7.1 \
&& ./configure --enable-optimizations \
&& make -j 8 \
&& make altinstall \
&& cd /usr/share/jenkins \
&& rm -r jenkins.war \
&& wget http://mirrors.jenkins.io/war/latest/jenkins.war \
&& rm -rf /tmp/Python-3.7.1 \
&& apt-get autoremove make \
&& apt-get autoclean \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
USER jenkins
