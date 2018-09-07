output "bastion_dns" {
  value = "${data.terraform_remote_state.baseInfra.bastion_dns}"
}

output "bastion_ip" {
  value = "${data.terraform_remote_state.baseInfra.*.bastion_public_ip}"
}

output "Machine_Dns" {
  value = "${aws_route53_record.testmachine.*.fqdn}"
}

data "template_file" "pwdEncoder" {
  count    = "${lookup(var.amis_accesss,var.testOs)=="rdp" ? var.anzahlInstanzen : 0}"
  template = "${base64encode(rsadecrypt(element(aws_instance.testmachine.*.password_data,count.index), tls_private_key.private_key.private_key_pem))}"
}

resource "local_file" "instancePwds" {
  count    = "${lookup(var.amis_accesss,var.testOs)=="rdp" ? var.anzahlInstanzen : 0}"
  content  = "${rsadecrypt(element(aws_instance.testmachine.*.password_data,count.index), tls_private_key.private_key.private_key_pem)}"
  filename = "${path.module}/keys/pwd_host-${count.index}_Administrator.txt"
}

# output "WindowsPassword" {
#   value = "${base64decode(data.template_file.pwdEncoder.*.rendered)}"
# }
