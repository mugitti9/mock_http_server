module "google_project_service" {
  source                      = "terraform-google-modules/project-factory/google//modules/project_services"
  version                     = "14.2.1"
  disable_services_on_destroy = false
  project_id                  = local.project_id
  enable_apis                 = true
  activate_apis               = local.services
}
