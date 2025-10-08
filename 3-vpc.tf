resource "google_compute_network" "vpc_network" {
  name                            = local.vpc
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
  depends_on                      = [google_project_service.api]
}

# Remove this route to make the vpc fully private.
# You will need this route for the NAT gateway.

resource "google_compute_route" "default_route" {
  name             = "tee-default-route"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc_network.id
  next_hop_gateway = "default_internet_gateway"

}
