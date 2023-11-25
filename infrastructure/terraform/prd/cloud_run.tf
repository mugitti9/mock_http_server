module "core_api_cloud_run" {
  source = "../_modules/google_cloud_run_service"

  service_name          = local.service_name
  project               = local.project_id
  env                   = local.env
  location              = local.location
  image_repository_name = module.cloud_run_image_artifact_registry.name
  image_name            = local.service_name

  depends_on = [
    module.google_project_service
  ]
}
