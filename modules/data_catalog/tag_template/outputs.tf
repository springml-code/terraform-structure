output "self_links" {
  value       = { for tag_template in google_data_catalog_tag_template.tag_template : element(split("/", tag_template.id), 5) => tag_template }
  description = "Map of the tag templates created"
}