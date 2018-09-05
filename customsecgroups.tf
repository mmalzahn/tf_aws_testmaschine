resource "aws_security_group" "SG_CustomTCP_IN_anywhere" {
  count       = "${var.external ? length(var.external_ports_tcp) : 0}"
  name        = "${local.resource_prefix}SG_CusTCP_${element(var.external_ports_tcp,count.index)}_IN-${count.index}"
  description = "Allow Custom TCP ${element(var.external_ports_tcp,count.index)} inbound traffic fuer Projekt ${var.project_name}"
  vpc_id      = "${data.terraform_remote_state.baseInfra.vpc_id}"

  ingress {
    from_port   = "${element(var.external_ports_tcp,count.index)}"
    to_port     = "${element(var.external_ports_tcp,count.index)}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65534
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    ignore_changes = ["tags.tf_created"]
  }

  tags = "${merge(local.common_tags,
            map(
              "Name", "${local.resource_prefix}SG_CusTCP_${element(var.external_ports_tcp,count.index)}_IN-${count.index}"
              )
              )}"
}
resource "aws_security_group" "SG_CustomUDP_IN_anywhere" {
  count       = "${var.external ? length(var.external_ports_udp) : 0}"
  name        = "${local.resource_prefix}SG_CusTCP_${element(var.external_ports_udp,count.index)}_IN-${count.index}"
  description = "Allow Custom TCP ${element(var.external_ports_udp,count.index)} inbound traffic fuer Projekt ${var.project_name}"
  vpc_id      = "${data.terraform_remote_state.baseInfra.vpc_id}"

  ingress {
    from_port   = "${element(var.external_ports_udp,count.index)}"
    to_port     = "${element(var.external_ports_udp,count.index)}"
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65534
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    ignore_changes = ["tags.tf_created"]
  }

  tags = "${merge(local.common_tags,
            map(
              "Name", "${local.resource_prefix}SG_CusUDP_${element(var.external_ports_udp,count.index)}_IN-${count.index}"
              )
              )}"
}
