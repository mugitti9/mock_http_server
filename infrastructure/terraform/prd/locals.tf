locals {
  service_name = "browser-mock"
  env          = "prd"
  location     = "asia-northeast1"
  project_id   = "sandbox-syuta-mugikura"
  project_num  = "1061100323164"
  # github_owner = "Q-Squared-Technologies"
  # github_repo  = "core-api"

  services = [
    # "iam.googleapis.com",
    # "firestore.googleapis.com",
    "artifactregistry.googleapis.com",
    "secretmanager.googleapis.com",
    "run.googleapis.com",
    # "firebase.googleapis.com",
    # "firestore.googleapis.com",
    # "calendar-json.googleapis.com",
    # "cloudscheduler.googleapis.com",
    # "cloudbuild.googleapis.com",
    # "iap.googleapis.com"
  ]

  secrets = toset([
    "slack-webhook-url"
  ])
}
