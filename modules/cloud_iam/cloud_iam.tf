/**
 * Copyright 2019 Google LLC
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

module "project-iam-bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  projects = var.project_names
  mode     = var.project_iam_mode

  bindings = var.project_iam_bindings

  conditional_bindings = var.project_conditional_bindings
}

module "folder-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  folders = var.folder_names

  mode = var.folder_iam_mode

  bindings = var.folder_iam_bindings

  conditional_bindings = var.folder_conditional_bindings
}