locals {
  common_tags {
    responsible     = "${var.tag_responsibel}"
    tf_managed      = "1"
    tf_project      = "dca:${terraform.workspace}:${random_id.randomPart.b64_url}:${replace(var.project_name," ","")}"
    tf_project_name = "DCA_${replace(var.project_name," ","_")}_${terraform.workspace}"
    tf_environment  = "${terraform.workspace}"
    tf_created      = "${timestamp()}"
    tf_runtime      = "${var.laufzeit_tage}"
    tf_responsible  = "${var.tag_responsibel}"
    tf_configId     = "${random_id.configId.b64_url}"
  }

  projId          = "${random_string.dnshostname.result}"
  resource_prefix = "${random_id.randomPart.b64_url}-${var.project_name}-${terraform.workspace}-"
}

module "baseInfra" {
   source = "github.com/mmalzahn/tf_module_getbaseinfrastruktur.git?ref=mainProd"
}

resource "random_integer" "randomScriptPort" {
  #count = "${lookup(var.amis_accesss,var.testOs)=="rdp" ? var.anzahlInstanzen : 0}"
  min   = 12000
  max   = 14000
  seed  = "${count.index}"
}

resource "random_string" "dnshostname" {
  length  = 10
  special = false
  upper   = false
  number  = false
}

resource "random_id" "configId" {
  byte_length = 16
}

resource "random_id" "randomPart" {
  byte_length = 4
}
