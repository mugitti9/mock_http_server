output "url" {
  value = google_cloud_run_service.default.status[0].url
}

output "name" {
  value = google_cloud_run_service.default.name
}
