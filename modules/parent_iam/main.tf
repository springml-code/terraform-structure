locals {
  org_id     = var.parent_type == "organization" ? var.parent_id : ""
  folder_id  = var.parent_type == "folder" ? var.parent_id : ""
  project_id = var.parent_type == "project" ? var.parent_id : ""
}

resource "google_organization_iam_member" "org_parent_iam" {
  for_each = toset(var.parent_type == "organization" ? var.roles : [])

  org_id = local.org_id
  role   = each.key
  member = var.member
}

resource "google_folder_iam_member" "folder_parent_iam" {
  for_each = toset(var.parent_type == "folder" ? var.roles : [])

  folder = local.folder_id
  role   = each.key
  member = var.member
}

resource "google_project_iam_member" "project_parent_iam" {
  for_each = toset(var.parent_type == "project" ? var.roles : [])

  project = local.project_id
  role    = each.key
  member  = var.member
}