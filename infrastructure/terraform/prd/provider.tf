provider "google" {
  project = local.project_id
  region  = local.location
  zone    = "${local.location}-a"
}

provider "google-beta" {
  user_project_override = true
  billing_project       = local.project_id
}

provider "google-beta" {
  alias                 = "no_user_project_override"
  user_project_override = false
}

terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }
}
