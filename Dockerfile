FROM ubuntu:16.04

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

ENV POWERSHELL_DL_URL="https://github.com/PowerShell/PowerShell/releases/download"
ENV POWERSHELL_VER="6.0.0-rc.2"
ENV POWERSHELL_PACKAGE="powershell_$POWERSHELL_VER-1.ubuntu.16.04_amd64.deb"

# Install PowerShell Pre-Reqs
RUN apt-get update && \
    apt-get install -y liblttng-ust0 libcurl3 libgssapi-krb5-2 libunwind8 \
    libssl1.0.0 libicu55

# Download PowerShell
ADD $POWERSHELL_DL_URL/v$POWERSHELL_VER/$POWERSHELL_PACKAGE /root

# Install PowerShell
RUN dpkg -i /root/$POWERSHELL_PACKAGE && \
    rm /root/$POWERSHELL_PACKAGE && \
    apt-get install -f

# Cleanup
RUN apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD [ "pwsh" ]
