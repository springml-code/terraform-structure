output "taxonomy_self_links" {
  value       = [for taxonomy in google_data_catalog_taxonomy.collection : taxonomy.name]
  description = "List of Taxonomy self links"
}

output "policy_tag_top_lvl_self_links" {
  value       = [for policy_tag in google_data_catalog_policy_tag.top_level : policy_tag.name]
  description = "List of top level policy tags self links"
}

output "policy_tag_lvl_one_self_links" {
  value       = [for policy_tag in google_data_catalog_policy_tag.lvl_one : policy_tag.name]
  description = "List of level one policy tags self links"
}

output "policy_tag_lvl_two_self_links" {
  value       = [for policy_tag in google_data_catalog_policy_tag.lvl_two : policy_tag.name]
  description = "List of level two policy tags self links"
}

output "policy_tag_lvl_three_self_links" {
  value       = [for policy_tag in google_data_catalog_policy_tag.lvl_three : policy_tag.name]
  description = "List of level three policy tags self links"
}

output "policy_tag_lvl_four_self_links" {
  value       = [for policy_tag in google_data_catalog_policy_tag.lvl_four : policy_tag.name]
  description = "List of level four policy tags self links"
}

output "policy_tag_self_links" {
  value       = [for policy_tag in merge(google_data_catalog_policy_tag.top_level, google_data_catalog_policy_tag.lvl_one, google_data_catalog_policy_tag.lvl_two, google_data_catalog_policy_tag.lvl_three, google_data_catalog_policy_tag.lvl_four) : policy_tag.name]
  description = "List of all policy tags self links"
}