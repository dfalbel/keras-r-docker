FROM rocker/tidyverse
MAINTAINER dfalbel <dfalbel@gmail.com>

# Install Python.
RUN apt-get update || apt-get update

RUN \
  apt-get update && apt-get install -y apt-transport-https && \
  apt-get install -y python python-dev python-pip python-virtualenv libssl-dev && \
  rm -rf /var/lib/apt/lists/*
  
RUN R -e "install.packages(c('keras'))"
RUN R -e "keras::install_keras()"