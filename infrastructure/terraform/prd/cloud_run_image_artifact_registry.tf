module "cloud_run_image_artifact_registry" {
  source       = "../_modules/google_artifact_registry_repository/cloud_run_image"
  env          = local.env
  project      = local.project_id
  service_name = local.service_name
  location     = local.location

  depends_on = [
    module.google_project_service
  ]
}
