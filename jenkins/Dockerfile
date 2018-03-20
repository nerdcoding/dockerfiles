FROM jenkins/jenkins

# Install git
USER root
RUN apt-get update && apt-get install -y git

USER jenkins

# Install Jenkins Plugins
RUN /usr/local/bin/install-plugins.sh greenballs pipeline-utility-steps bitbucket

# Create SSH key in JENKINS_HOME
#RUN mkdir /var/jenkins_home/.ssh
#RUN ssh-keygen -q -t rsa -N '' -f /var/jenkins_home/.ssh/id_rsa