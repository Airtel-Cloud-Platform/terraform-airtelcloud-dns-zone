locals {
  zones = {
    primary = {
      zone_name   = "example.com"
      description = "Primary DNS zone for example.com"
    }

    internal = {
      zone_name   = "internal.example.com"
      description = "Internal services DNS zone"
    }
  }
}

module "dns_zone" {
  source   = "../../"
  for_each = local.zones

  zone_name   = each.value.zone_name
  zone_type   = "forward"
  description = each.value.description
}

output "zone_ids" {
  value = { for k, z in module.dns_zone : k => z.zone_id }
}
