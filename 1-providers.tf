provider "google" {
  project = local.project-id
  region  = local.region
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 7.6.0"
    }
  }
}
