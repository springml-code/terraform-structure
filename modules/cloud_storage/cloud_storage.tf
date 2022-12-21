/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "gcs_buckets" {
  source                   = "terraform-google-modules/cloud-storage/google"
  version                  = "3.4.0"
  project_id               = var.project_id
  names                    = var.names
  prefix                   = var.prefix
  location                 = var.location
  storage_class            = var.storage_class
  force_destroy            = var.force_destroy
  encryption_key_names     = var.encryption_key_names
  bucket_policy_only       = var.bucket_policy_only
  set_admin_roles          = var.set_admin_roles
  set_creator_roles        = var.set_creator_roles
  set_viewer_roles         = var.set_viewer_roles
  set_hmac_key_admin_roles = var.set_hmac_key_admin_roles
  set_storage_admin_roles  = var.set_storage_admin_roles
  lifecycle_rules          = var.lifecycle_rules
  cors                     = var.cors
  website                  = var.website
  retention_policy         = var.retention_policy
  logging                  = var.logging
  admins                   = var.admins
  creators                 = var.creators
  viewers                  = var.viewers
  hmac_key_admins          = var.hmac_key_admins
  storage_admins           = var.storage_admins
  bucket_admins            = var.bucket_admins
  bucket_creators          = var.bucket_creators
  bucket_viewers           = var.bucket_viewers
  bucket_hmac_key_admins   = var.bucket_hmac_key_admins
  bucket_storage_admins    = var.bucket_storage_admins
  labels                   = var.labels
  folders                  = var.folders
  versioning               = var.versioning
}
