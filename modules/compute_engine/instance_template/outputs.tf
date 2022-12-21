output "template_self_link" {
  description = "Self-link of instance template"
  value       = module.instance_template.self_link
}

output "template_name" {
  description = "Name of instance template"
  value       = module.instance_template.name
}

output "template_tags" {
  description = "Tags that will be associated with instance(s)"
  value       = module.instance_template.tags
}
