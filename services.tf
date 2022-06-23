
resource "google_project_iam_member" "default_sa_roles" {
  project = var.project
  role    = "roles/container.admin"
  member  = "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "cloudbuild_sa_roles" {
  for_each = toset(var.iam_roles_cb)
  project  = var.project
  role     = each.value
  member   = "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com"
}
