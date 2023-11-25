resource "google_cloud_run_service" "default" {
  name                       = "${var.service_name}-${var.env}"
  location                   = var.location
  autogenerate_revision_name = true

  template {
    spec {
      containers {
        image = "${var.location}-docker.pkg.dev/${var.project}/${var.image_repository_name}/${var.image_name}"
        env {
          name = "SLACK_WEBHOOK_URL"
          value_from {
            secret_key_ref {
              name = "slack-webhook-url-${var.service_name}-${var.env}"
              key  = "1"
            }
          }
        }
        resources {
          limits = {
            "cpu" : "1000m"
            "memory" : "1Gi"
          }
        }
      }
      service_account_name = google_service_account.cloud_run.email
    }
    metadata {
      annotations = {
        "run.googleapis.com/client-name"        = "gcloud"
        "run.googleapis.com/client-version"     = "453.0.0"
        "autoscaling.knative.dev/maxScale"      = "1000"
        "run.googleapis.com/startup-cpu-boost"  = true
      }
    }
  }
  lifecycle {
    ignore_changes = [
      template[0].spec[0].containers[0].image
    ]
  }
  depends_on = [
    google_project_iam_member.secret_manager
  ]
}

resource "google_cloud_run_service_iam_member" "member" {
  location = var.location
  project  = var.project
  service  = google_cloud_run_service.default.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_service_account" "cloud_run" {
  project      = var.project
  account_id   = random_string.cloud_run.result
  display_name = "Service Account for google cloud run in ${var.service_name} ${var.env}"
}

resource "random_string" "cloud_run" {
  length  = 8
  special = false
  upper   = false
  lower   = true
  numeric = false
}

resource "google_project_iam_member" "secret_manager" {
  project = var.project
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.cloud_run.email}"
}

resource "google_project_iam_member" "cloud_run_invoker" {
  project = var.project
  role    = "roles/run.invoker"
  member  = "serviceAccount:${google_service_account.cloud_run.email}"
}
