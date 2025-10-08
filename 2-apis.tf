# resource "google_project_service" "compute" {
#   project = local.project-id
#   service = "compute.googleapis.com"
#   disable_on_destroy = false

# }

# resource "google_project_service" "container" {
#   project = local.project-id
#   service = "container.googleapis.com"
#   disable_on_destroy = false

# }
# resource "google_project_service" "logging" {
#   project = local.project-id
#   service = "logging.googleapis.com"
#   disable_on_destroy = false

# }
# resource "google_project_service" "secretmanager" {
#   project = local.project-id
#   service = "secretmanager.googleapis.com"
#   disable_on_destroy = false
# }
resource "google_project_service" "api" {
  project            = local.project-id
  for_each           = toset(local.apis)
  service            = each.key
  disable_on_destroy = false
}
