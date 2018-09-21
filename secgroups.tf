resource "aws_security_group" "SG_RDP_IN_extern" {
  count       = "${var.external ? lookup(var.amis_accesss,var.testOs) == "rdp" ? 1 : 0 : 0}"
  name        = "${local.resource_prefix}SG_RDP_IN_extern"
  description = "Allow RDP Management inbound traffic fuer Projekt ${var.project_name}"
  vpc_id      = "${module.baseInfra.vpc_id}"

  ingress {
    from_port   = "3389"
    to_port     = "3389"
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
              "Name", "${local.resource_prefix}SG_RDP_IN_extern"
              )
              )}"
}

resource "aws_security_group" "SG_RDP_IN_intern" {
  count       = "${var.external ? 0 : lookup(var.amis_accesss,var.testOs) == "rdp" ? 1 : 0 }"
  name        = "${local.resource_prefix}SG_RDP_IN_intern"
  description = "Allow RDP Management inbound traffic fuer Projekt ${var.project_name}"
  vpc_id      = "${module.baseInfra.vpc_id}"

  ingress {
    from_port       = "3389"
    to_port         = "3389"
    protocol        = "tcp"
    security_groups = ["${module.baseInfra.bastion_sg}"]
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
              "Name", "${local.resource_prefix}SG_RDP_IN_intern"
              )
              )}"
}

resource "aws_security_group" "SG_SSH_IN_extern" {
  count       = "${var.external ? lookup(var.amis_accesss,var.testOs) == "ssh" ? 1 : 0 : 0}"
  name        = "${local.resource_prefix}SG_SSH_IN_extern"
  description = "Allow SSH Management inbound traffic fuer Projekt ${var.project_name}"
  vpc_id      = "${module.baseInfra.vpc_id}"

  ingress {
    from_port   = "22"
    to_port     = "22"
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
              "Name", "${local.resource_prefix}SG_SSH_IN_extern"
              )
              )}"
}

resource "aws_security_group" "SG_SSH_IN_intern" {
  count       = "${var.external ? 0 : lookup(var.amis_accesss,var.testOs) == "ssh" ? 1 : 0}"
  name        = "${local.resource_prefix}SG_SSH_IN_intern"
  description = "Allow SSH Management inbound traffic fuer Projekt ${var.project_name}"
  vpc_id      = "${module.baseInfra.vpc_id}"

  ingress {
    from_port       = "22"
    to_port         = "22"
    protocol        = "tcp"
    security_groups = ["${module.baseInfra.bastion_sg}"]
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
              "Name", "${local.resource_prefix}SG_SSH_IN_intern"
              )
              )}"
}

resource "aws_security_group" "SG_Ping_enable" {
  count       = "${var.pingable ? 1 : 0}"
  name        = "${local.resource_prefix}SG_Ping_enable"
  description = "Allow PING fuer Projekt ${var.project_name}"
  vpc_id      = "${module.baseInfra.vpc_id}"

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    ignore_changes = ["tags.tf_created"]
  }

  tags = "${merge(local.common_tags,
            map(
              "Name", "${local.resource_prefix}SG_Ping_enable"
              )
              )}"
}