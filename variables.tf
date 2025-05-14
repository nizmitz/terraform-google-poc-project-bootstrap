variable "project_id" {
  type        = string
  description = "Project id of the project that holds the network."
}

variable "region" {
  type        = string
  default     = "asia-southeast1"
  description = "Region of the project that is hosted."
}

variable "zone" {
  type        = string
  default     = "a"
  description = "Zone of the project that is hosted."
}

variable "ip_cidr_range" {
  type        = list(string)
  default     = ["10.0.0.0/24"]
  description = "ip range that will be used for the vpc"
}

variable "bucket_location" {
  type        = string
  default     = "ASIA-SOUTHEAST2"
  description = "Terraform State bucket location"
}

variable "service_list" {
  type        = set(string)
  description = "default enabled services"
  default = ["iam.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "iamcredentials.googleapis.com",
    "recommender.googleapis.com",
    "storage-api.googleapis.com",
    "stackdriver.googleapis.com",
    "sqladmin.googleapis.com",
  ]
}
