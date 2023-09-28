locals {
  service_name = "mock-http"
  env = "prd"
  project_id = "self-developing-396413"
  location = "us-central1"

  services = toset([
    "cloudbuild.googleapis.com",
    "cloudfunctions.googleapis.com",
  ])
}
