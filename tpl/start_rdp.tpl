$cmd='ssh -L ${random_port}:${host_fqdn}:3389 -i .\keys\${userid}.key.pem -l ${userid} -C -T -N -v -4 -o "StrictHostKeyChecking=false" ${bastionhost_fqdn}'

Invoke-Expression -Command "cmd /c start cmd /c $cmd"
Start-Sleep -Seconds 5

mstsc.exe /v:localhost:${random_port}
