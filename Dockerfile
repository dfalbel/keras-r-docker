FROM rocker/tidyverse
MAINTAINER decryptr <dfalbel@gmail.com>

RUN \
  apt-get update && apt-get install -y apt-transport-https && \
  apt-get install -y python python-dev python-pip python-virtualenv libssl-dev libjpeg-dev && \
  rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('keras', 'plumber', 'yaml', 'base64enc', 'remotes'))"
RUN R -e "keras::install_keras()"

# Install captcha-breaking captchas
RUN R -e "remotes::install_github('decryptr/decryptr')"

