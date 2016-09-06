FROM ubuntu:16.04

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

ENV POWERSHELL_VER="6.0.0-alpha.9"

# Install Powershell Pre-Reqs
RUN apt-get update && \
    apt-get install -y curl libunwind8 libicu55

# Download Powershell
RUN curl -LO https://github.com/PowerShell/PowerShell/releases/download/v$POWERSHELL_VER/powershell_$POWERSHELL_VER-1ubuntu1.16.04.1_amd64.deb

# Install Powershell
RUN dpkg -i powershell_$POWERSHELL_VER-1ubuntu1.16.04.1_amd64.deb

Entrypoint [ "powershell" ]
