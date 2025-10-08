resource "google_compute_subnetwork" "tee-public-subnet" {
  name                     = local.public-subnet
  ip_cidr_range            = local.public-subnet-cidr
  region                   = local.region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true
  stack_type               = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "tee-private-subnet" {
  name                     = local.private-subnet
  ip_cidr_range            = local.private-subnet-cidr
  region                   = local.region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true
  stack_type               = "IPV4_ONLY"

  secondary_ip_range {
    range_name    = "k8s-pods"
    ip_cidr_range = "172.16.0.0/14"

  }
  secondary_ip_range {
    range_name    = "k8s-services"
    ip_cidr_range = "172.20.0.0/18"

  }

}
