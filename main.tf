locals {
  storage_class = "STANDARD"
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


################################################################################
#                                 Grants Segment                               #
################################################################################

resource "google_project_iam_member" "project" {
  for_each = var.user_grant_map
  project  = var.project_id
  role     = each.value
  member   = each.key
}
