 msiexec /i `
 https://github.com/prometheus-community/windows_exporter/releases/download/v0.18.1/windows_exporter-0.18.1-amd64.msi `
 LISTEN_PORT=9100 `
 ENABLED_COLLECTORS=cpu,cs,cache,container,logical_disk,memory,net,os,service,system,tcp