FROM ubuntu:19.04

RUN echo 'alias ll="ls -al"' >> /etc/bash.bashrc
RUN apt-get update
RUN apt-get install -y curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
