FROM ubuntu:19.04

LABEL MAINTAINER="Jose Luis Jimenez hola@ijos.es"

USER root

# Download packages
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://unity-accelerator-prd.storage.googleapis.com/unity-accelerator-linux-installer.run -P /opt

RUN chmod +x /opt/unity-accelerator-linux-installer.run

RUN mkdir /opt/accelerator-cache

RUN /opt/unity-accelerator-linux-installer.run \
  --storagedir /opt/accelerator-cache \
  --mode unattended \
  --enable-cdp false

RUN rm -f /opt/unity-accelerator-linux-installer.run

CMD service unity-accelerator start && tail -f /opt/accelerator-cache/unity-accelerator.log
