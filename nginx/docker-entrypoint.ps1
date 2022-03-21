# replace upstream server details in nginx conf with env vars 
$NGINX_VERSION=1.21.6
$PROXY_HOSTIP=$env:PROXY_HOSTIP
$PROXY_PORT=$env:PROXY_PORT

$conf1=Get-Content C:\nginx-1.21.6\shell\edit-nginx.conf `
    | % { $_ -replace "PROXY_HOSTIP","$PROXY_HOSTIP"} `
    | % { $_ -replace "PROXY_PORT","$PROXY_PORT"} `

$conf1 | Out-File  -Encoding Default  C:\nginx-1.21.6\shell\nginx.conf

Move-Item C:\nginx-1.21.6\conf\nginx.conf C:\nginx-1.21.6
Move-Item C:\nginx-1.21.6\shell\nginx.conf C:\nginx-1.21.6\conf\nginx.conf

CMD /C /nginx-1.21.6/nginx.exe