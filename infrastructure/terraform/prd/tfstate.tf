module "tfstate_bucket" {
  source   = "../_modules/tfstate"
  name     = "tfstate-${local.service_name}-${local.env}"
  location = local.location
}
