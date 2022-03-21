FROM mcr.microsoft.com/windows/servercore:ltsc2019
SHELL ["powershell", "-Command"]
ARG NGINX_VERSION=1.21.6
RUN $ErrorActionPreference = 'Stop'; \
    Invoke-WebRequest -Method Get -Uri https://nginx.org/download/nginx-$env:NGINX_VERSION.zip -OutFile c:\nginx-$env:NGINX_VERSION.zip ; \
    Expand-Archive -Path c:\nginx-$env:NGINX_VERSION.zip -DestinationPath c:\ ; \
    Remove-Item c:\nginx-$env:NGINX_VERSION.zip -Force

WORKDIR /nginx-$NGINX_VERSION

RUN mkdir shell
COPY edit-nginx.conf ./shell
COPY docker-entrypoint.ps1 ./shell

ENTRYPOINT [ "powershell.exe", "./shell/docker-entrypoint.ps1" ]