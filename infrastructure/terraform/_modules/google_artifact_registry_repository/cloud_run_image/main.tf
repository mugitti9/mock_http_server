resource "google_artifact_registry_repository" "cloud_run_image" {
  provider               = google-beta
  project                = var.project
  location               = var.location
  repository_id          = "${var.service_name}-${var.env}-docker-image"
  description            = "docker repository for ${var.env}"
  format                 = "DOCKER"
  cleanup_policy_dry_run = false
  cleanup_policies {
    id     = "cloud_run_delete"
    action = "DELETE"
    condition {
      older_than = "604800s"
    }
  }
}
