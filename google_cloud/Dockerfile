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
RUN apt-get install -y vim
RUN apt-get install -y lsb-release

# Install Google Cloud SDK
ENV CLOUD_SDK_REPO="cloud-sdk-stretch" 
RUN echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN echo $CLOUD_SDK_REPO
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update && apt-get install -y google-cloud-sdk && apt-get install -y kubectl

# Install TravisCI command line tool
RUN apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev git-core -y
RUN apt-get -y install ruby-dev
RUN gem install travis
