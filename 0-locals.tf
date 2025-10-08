locals {
  project-id          = "tee-ghactions"
  region              = "us-central1"
  vpc                 = "tee-vpc-network"
  vpc-cidr            = "10.0.0.0/16"
  public-subnet       = "tee-public"
  public-subnet-cidr  = "10.0.1.0/24"
  private-subnet      = "tee-private"
  private-subnet-cidr = "10.0.2.0/24"
  apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "logging.googleapis.com",
    "secretmanager.googleapis.com"
  ]
}
