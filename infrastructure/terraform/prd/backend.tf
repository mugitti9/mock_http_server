terraform {
  backend "gcs" {
    bucket = "tfstate-core-api-prd"
    prefix = "terraform/state"
  }
}
