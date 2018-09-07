ssh -i ".\keys\${userid}.key.pem" -l "${userid}" -C -v -4 -W "${userid}@${host_fqdn}:22" -o "StrictHostKeyChecking=false" ${bastionhost_fqdn}
