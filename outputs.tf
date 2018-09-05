 output "bastion_dns" {
   value = "${data.terraform_remote_state.baseInfra.bastion_dns}"
 }

 output "bastion_ip" {
   value = "${data.terraform_remote_state.baseInfra.bastion_public_ip}"
 }

 output "Machine_Dns" {
   value = "${aws_route53_record.testmachine.*.fqdn}"
 }

data "template_file" "pwdEncoder" {
  count = "${length(aws_instance.testmachine.*.password_data)}"
  template = "${rsadecrypt(element(aws_instance.testmachine.*.password_data,count.index), tls_private_key.private_key.private_key_pem)}"
}

output "WindowsPassword" {
  value = "${data.template_file.pwdEncoder.*.rendered}"
}
