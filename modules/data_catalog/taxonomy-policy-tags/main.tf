locals {

  top_level_policy_tags = flatten([
    for taxonomy in var.taxonomy_policy_tags : [
      for tag in lookup(taxonomy, "policy_tags", {}) : {
        taxonomy_id  = taxonomy.id
        id           = tag != {} ? tag.id : null
        display_name = tag != {} ? tag.display_name : null
        description  = tag != {} ? tag.description : null
      }
    ]
  ])

  lvl_one_policy_tags = flatten([
    for taxonomy in var.taxonomy_policy_tags : [
      for tag in lookup(taxonomy, "policy_tags", {}) : [
        for lvl_tag in coalesce(lookup(tag, "level_one", {}), [{}]) : {
          taxonomy_id  = taxonomy.id
          top_level_id = tag != {} ? lvl_tag.parent_tag : null
          id           = lvl_tag != [{}] ? lvl_tag.id : null
          display_name = lvl_tag != [{}] ? lvl_tag.display_name : null
          description  = lvl_tag != [{}] ? lvl_tag.description : null
        } if length(lvl_tag) > 0
      ]
    ]
  ])

  lvl_two_policy_tags = flatten([
    for taxonomy in var.taxonomy_policy_tags : [
      for tag in lookup(taxonomy, "policy_tags", {}) : [
        for lvl_tag in coalesce(lookup(tag, "level_two", {}), [{}]) : {
          taxonomy_id  = taxonomy.id
          lvl_one_id   = tag != {} ? lvl_tag.parent_tag : null
          id           = lvl_tag != [{}] ? lvl_tag.id : null
          display_name = lvl_tag != [{}] ? lvl_tag.display_name : null
          description  = lvl_tag != [{}] ? lvl_tag.description : null
        } if length(lvl_tag) > 0
      ]
    ]
  ])

  lvl_three_policy_tags = flatten([
    for taxonomy in var.taxonomy_policy_tags : [
      for tag in lookup(taxonomy, "policy_tags", {}) : [
        for lvl_tag in coalesce(lookup(tag, "level_three", {}), [{}]) : {
          taxonomy_id  = taxonomy.id
          lvl_two_id   = lvl_tag != [{}] && tag != [{}] ? lvl_tag.parent_tag : null
          id           = lvl_tag != [{}] ? lvl_tag.id : null
          display_name = lvl_tag != [{}] ? lvl_tag.display_name : null
          description  = lvl_tag != [{}] ? lvl_tag.description : null
        } if length(lvl_tag) > 0
      ]
    ]
  ])

  lvl_four_policy_tags = flatten([
    for taxonomy in var.taxonomy_policy_tags : [
      for tag in lookup(taxonomy, "policy_tags", {}) : [
        for lvl_tag in coalesce(lookup(tag, "level_four", {}), [{}]) : {
          taxonomy_id  = taxonomy.id
          lvl_three_id = lvl_tag != [{}] && tag != {} ? lvl_tag.parent_tag : null
          id           = lvl_tag != [{}] ? lvl_tag.id : null
          display_name = lvl_tag != [{}] ? lvl_tag.display_name : null
          description  = lvl_tag != [{}] ? lvl_tag.description : null
        } if length(lvl_tag) > 0
      ]
    ]
  ])
}

resource "google_data_catalog_taxonomy" "collection" {
  provider = google-beta

  for_each               = { for taxonomy in var.taxonomy_policy_tags : taxonomy.id => taxonomy }
  project                = var.project
  region                 = var.region
  display_name           = each.value.display_name
  description            = each.value.description
  activated_policy_types = lookup(each.value, "activated_policy_types", "POLICY_TYPE_UNSPECIFIED")
}

// Bit of a hack, but currently policy tags can only be 4 layers deep
// So lets just hard-code that into our configuration
resource "google_data_catalog_policy_tag" "top_level" {
  provider = google-beta

  for_each     = { for tag in local.top_level_policy_tags : tag.id => tag if tag.id != null }
  taxonomy     = google_data_catalog_taxonomy.collection[each.value.taxonomy_id].id
  display_name = each.value.display_name
  description  = each.value.description
}

resource "google_data_catalog_policy_tag" "lvl_one" {
  provider = google-beta

  for_each          = { for tag in local.lvl_one_policy_tags : tag.id => tag if tag.id != null }
  taxonomy          = google_data_catalog_taxonomy.collection[each.value.taxonomy_id].id
  display_name      = each.value.display_name
  description       = each.value.description
  parent_policy_tag = google_data_catalog_policy_tag.top_level[each.value.top_level_id].id

  depends_on = [
    google_data_catalog_policy_tag.top_level
  ]
}

resource "google_data_catalog_policy_tag" "lvl_two" {
  provider = google-beta

  for_each          = { for tag in local.lvl_two_policy_tags : tag.id => tag if tag.id != null }
  taxonomy          = google_data_catalog_taxonomy.collection[each.value.taxonomy_id].id
  display_name      = each.value.display_name
  description       = each.value.description
  parent_policy_tag = google_data_catalog_policy_tag.lvl_one[each.value.lvl_one_id].id

  depends_on = [
    google_data_catalog_policy_tag.top_level,
    google_data_catalog_policy_tag.lvl_one
  ]
}

resource "google_data_catalog_policy_tag" "lvl_three" {
  provider = google-beta

  for_each          = { for tag in local.lvl_three_policy_tags : tag.id => tag if tag.id != null }
  taxonomy          = google_data_catalog_taxonomy.collection[each.value.taxonomy_id].id
  display_name      = each.value.display_name
  description       = each.value.description
  parent_policy_tag = google_data_catalog_policy_tag.lvl_two[each.value.lvl_two_id].id

  depends_on = [
    google_data_catalog_policy_tag.top_level,
    google_data_catalog_policy_tag.lvl_one,
    google_data_catalog_policy_tag.lvl_two
  ]
}

resource "google_data_catalog_policy_tag" "lvl_four" {
  provider = google-beta

  for_each          = { for tag in local.lvl_four_policy_tags : tag.id => tag if tag.id != null }
  taxonomy          = google_data_catalog_taxonomy.collection[each.value.taxonomy_id].id
  display_name      = each.value.display_name
  description       = each.value.description
  parent_policy_tag = google_data_catalog_policy_tag.lvl_three[each.value.lvl_three_id].id

  depends_on = [
    google_data_catalog_policy_tag.top_level,
    google_data_catalog_policy_tag.lvl_one,
    google_data_catalog_policy_tag.lvl_two,
    google_data_catalog_policy_tag.lvl_three
  ]
}