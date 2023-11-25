resource "google_secret_manager_secret" "secrets" {
  for_each  = local.secrets
  secret_id = "${each.value}-${local.service_name}-${local.env}"

  labels = {
    label = local.project_id
  }

  lifecycle {
    prevent_destroy = true
  }

  replication {
    auto {}
  }

  depends_on = [
    module.google_project_service
  ]
}
