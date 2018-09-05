resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "local_file" "privateKeyFile" {
  content  = "${tls_private_key.private_key.private_key_pem}"
  filename = "${path.module}/keys/private.pem"
}

resource "local_file" "publicKeyFile" {
  content  = "${tls_private_key.private_key.public_key_pem}"
  filename = "${path.module}/keys/public.pem"
}

resource "local_file" "publicKeyFileOpenSsh" {
  content  = "${tls_private_key.private_key.public_key_openssh}"
  filename = "${path.module}/keys/public_openssh.pub"
}

resource "aws_key_pair" "keypair" {
  key_name   = "${random_string.dnshostname.result}"
  public_key = "${tls_private_key.private_key.public_key_openssh}"
  depends_on = ["tls_private_key.private_key"]
}
