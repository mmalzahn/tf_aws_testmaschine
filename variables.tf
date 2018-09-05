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
  type    = "list"
  default = []
}

variable "external_ports_tcp" {
  type    = "list"
  default = []
}

variable "pingable" {
  default = true
}

variable "aws_keyname" {
  default = ""
}

variable "anzahlInstanzen" {
  default = 1
}

variable "aws_amis" {
  default = {
    AmazonLinux     = "ami-047bb4163c506cd98"
    Ubuntu16        = "ami-0181f8d9b6f098ec4"
    SLES15          = "ami-050889503ddaec473"
    RedHat          = "ami-7c491f05"
    Windows2008R2   = "ami-0700515e5a454e3b3"
    Windows2012     = "ami-0e0bcd012dca25079"
    Windows2012R2   = "ami-04191f05759452cfa"
    Windows2016base = "ami-088f9db67b4afec52"
    Windows2016wC   = "ami-049abf0b1372beb53"
    Windows1703wC   = "ami-01a0ec1993186c610"
    Windows1803wC   = "ami-068a5d5273c6e797e"
  }
}

variable "amis_accesss" {
  default = {
    AmazonLinux     = "ssh"
    Ubuntu16        = "ssh"
    SLES15          = "ssh"
    RedHat          = "ssh"
    Windows2008R2   = "rdp"
    Windows2012     = "rdp"
    Windows2012R2   = "rdp"
    Windows2016base = "rdp"
    Windows2016wC   = "rdp"
    Windows1703wC   = "rdp"
    Windows1803wC   = "rdp"
  }
}
