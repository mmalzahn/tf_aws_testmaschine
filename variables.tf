variable "aws_region" {}
variable "project_name" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "tag_responsibel" {}

variable "backend_key" {
  default = "baseinfrastruktur.state"
}

variable "laufzeit_tage" {
  default = "60"
}

variable "testOs" {
  default = "AmazonLinux"
}

variable "external" {
  default = false
}

variable "external_ports_udp" {
  type="list"
  default = []
}
variable "external_ports_tcp" {
  type="list"
  default = []
}

variable "pingable" {
  default = true
}

variable "aws_keyname" {
  default =""
}
variable "anzahlInstanzen" {
  default = 1
}

variable "aws_amis" {
  default = {
    AmazonLinux   = "ami-e4515e0e"
    Ubuntu16      = "ami-0181f8d9b6f098ec4"
    SLES15        = "ami-050889503ddaec473"
    RedHat        = "ami-7c491f05"
    Windows2008R2 = "ami-0d3b439ae66ab28a9"
    Windows2012   = "ami-0d3b439ae66ab28a9"
    Windows2012R2 = "ami-0d3b439ae66ab28a9"
    Windows2016   = "ami-049abf0b1372beb53"
    Windows1703   = "ami-01a0ec1993186c610"
    Windows1803   = "ami-068a5d5273c6e797e"
  }
}
variable "amis_accesss" {
  default = {
    AmazonLinux   = "ssh"
    Ubuntu16      = "ssh"
    SLES15        = "ssh"
    RedHat        = "ssh"
    Windows2008R2 = "rdp"
    Windows2012   = "rdp"
    Windows2012R2 = "rdp"
    Windows2016   = "rdp"
    Windows1703   = "rdp"
    Windows1803   = "rdp"
  }
}
