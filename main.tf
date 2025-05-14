locals {
  storage_class = "STANDARD"
}

################################################################################
#                                Network Segment                               #
################################################################################

resource "google_compute_network" "this" {
  name                    = "vpc"
  project                 = var.project_id
  auto_create_subnetworks = false
  depends_on              = [google_project_service.this]
}

resource "google_compute_subnetwork" "this" {
  name          = "subnet"
  project       = var.project_id
  ip_cidr_range = var.ip_cidr_range[0]
  region        = var.region
  network       = google_compute_network.this.self_link
}

################################################################################
#                            Project API Segment                               #
################################################################################


resource "google_project_service" "this" {
  for_each                   = var.service_list
  project                    = var.project_id
  service                    = each.value
  disable_dependent_services = true
  disable_on_destroy         = true

  timeouts {
    create = "30m"
    update = "40m"
  }
}

################################################################################
#                            GCS Buckets Segment                               #
################################################################################

resource "random_string" "terraform_state" {
  length  = 6
  special = false
  upper   = false

}

resource "google_storage_bucket" "terraform_state" {
  name                        = var.project_id
  project                     = var.project_id
  location                    = var.bucket_location
  storage_class               = local.storage_class
  force_destroy               = true
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  versioning {
    enabled = true
  }
}
