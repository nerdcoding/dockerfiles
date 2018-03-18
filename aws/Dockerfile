FROM debian:9.4

RUN echo 'alias ll="ls -al"' >> /etc/bash.bashrc

RUN apt-get update 
RUN apt-get install -y apt-utils 
RUN apt-get install -y net-tools 
RUN apt-get install -y curl
RUN apt-get install -y gnupg2
RUN apt-get install -y git
RUN apt-get install -y jq
RUN apt-get install -y unzip
RUN apt-get install -y wget
RUN apt-get install -y python
RUN apt-get install -y python-pip
RUN apt-get install -y vim

# AWS client
RUN curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN rm -rf awscli-bundle/ awscli-bundle.zip

# Amazon ECS CLI
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod 755 /usr/local/bin/ecs-cli

# Docker
RUN curl -sSL https://get.docker.com/ | sh

# Terraform
ENV TERRAFORM_VERSION="0.11.4"
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN chmod 711 terraform
RUN mv terraform /usr/local/bin/terraform
RUN rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Ansible
RUN pip install ansible
