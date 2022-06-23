variable "region" {
  default = "europe-west2"
}

variable "location" {
  default = "europe-west2-a"
}

variable "network_name" {
  default = "tf-gke-k8s"
}

provider "google" {
  region = var.region
}

resource "google_compute_network" "default" {
  name                    = var.network_name
  auto_create_subnetworks = false
}


terraform {
  backend "gcs" {
    bucket = "urban-tf-state-staging"
    prefix = terraform/state
  }
}  
    
required_providers {
  google = {
    source = hashicorp/google"
    version = ~> 4.0"
  }
}  
