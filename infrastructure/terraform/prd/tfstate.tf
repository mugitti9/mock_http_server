module "tfstate_bucket" {
  source = "../_modules/tfstate"

  name = "${local.service_name}-${local.env}-tfstate"
  location = local.location
}
