module "label" {
  source      = "git@github.com:devopsteamG/terraform-null-label.git?ref=master"
  stage       = terraform.workspace
  namespace   = "max"
  name        = "bharath"
  delimiter   = "-"
  label_order = ["stage", "namespace", "name"]
  tags = {
    "Environment"     = title(terraform.workspace)
    "Customer"        = "HBOMAX-DE"
    "Interface"       = "Private"
    "Project"         = "AWS Resources for Max Galileo"
    "ApplicationType" = "DataEngineering"
    "Managed_by"      = "DAPAdminTeam"
    "RequestBy"       = "DAPAdminTeam"
    
  }
}
