FROM ubuntu:16.04

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

ENV POWERSHELL_DL_URL="https://github.com/PowerShell/PowerShell/releases/download"
ENV POWERSHELL_VER="6.0.0-alpha.11"
ENV POWERSHELL_PACKAGE="powershell_$POWERSHELL_VER-1ubuntu1.16.04.1_amd64.deb"

# Install Powershell Pre-Reqs
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl libcurl3 libunwind8 libicu55

# Download Powershell and Install
RUN curl -LO $POWERSHELL_DL_URL/v$POWERSHELL_VER/$POWERSHELL_PACKAGE && \
    dpkg -i $POWERSHELL_PACKAGE && \
    rm $POWERSHELL_PACKAGE && \
    apt-get install -f

# Cleanup
RUN apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

Entrypoint [ "powershell" ]
