##  AmazonLinux     = "ami-047bb4163c506cd98"
##  Ubuntu16        = "ami-0181f8d9b6f098ec4"
##  SLES15          = "ami-050889503ddaec473"
##  RedHat          = "ami-7c491f05"
##  Windows2008R2   = "ami-0700515e5a454e3b3"
##  Windows2012     = "ami-0e0bcd012dca25079"
##  Windows2012R2   = "ami-04191f05759452cfa"
##  Windows2016base = "ami-088f9db67b4afec52"
##  Windows2016wC   = "ami-049abf0b1372beb53"
##  Windows1703wC   = "ami-01a0ec1993186c610"
##  Windows1803wC   = "ami-068a5d5273c6e797e"
## 
testOs = "AmazonLinux"

anzahlInstanzen = 1

tag_responsibel = "Max Mustermann"

instance_type = "t2.micro"

project_name = "MusterProject1"

remote_state_bucket = "tf-state-bodyxsddzhllgkrg"

# remote_state_key = "baseinfrastruktur.state"

pingable = false

external = false

external_ports_tcp = ["80", "443", "8443"]

external_ports_udp = ["53"]

remote_state_bucket_region = "eu-west-1"

aws_region = "eu-west-1"
