output "project_id" {
  value = var.project_id
}

output "zone" {
  value = "${var.region}-${var.zone}"
}

output "terraform_state_bucket_id" {
  value = google_storage_bucket.terraform_state.id
}
