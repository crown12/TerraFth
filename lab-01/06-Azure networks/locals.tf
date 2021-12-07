locals {
  owners              = var.business_division
  environment         = var.environment
  resouce_name_prefix = "${var.business_division}-${var.environment}"

  common_tags = {
    owners      = local.owners,
    environment = local.environment
  }
}

