$cmd='ssh -L 127.0.0.1:${random_port}:${host_fqdn}:22 -i .\keys\${userid}.key.pem -l ${userid} -C -T -N -v -4 -o "StrictHostKeyChecking=false" ${bastionhost_fqdn}'

Invoke-Expression -Command "cmd /c start cmd /c $cmd"
Start-Sleep -Seconds 5

ssh -i .\keys\${userid}.key.pem -l ${ec2_userid} -p ${random_port} -4 -o "StrictHostKeyChecking=false" 127.0.0.1
