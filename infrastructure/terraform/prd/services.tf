resource "google_project_service" "default" {
  for_each = local.services
  project = local.project_id
  service = each.value
}
