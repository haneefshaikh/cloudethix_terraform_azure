locals {
  tag_names = {
    application = var.application,
    product     = var.product,
    environment = var.environment
  }
}

output "tag" {
  value = format("%s-%s-%s", var.application, var.product, var.environment)
}
output "tag_names" {
  value = local.tag_names
}