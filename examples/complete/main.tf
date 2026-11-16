module "dns_zone" {
  source = "../../"

  zone_name = "example.com"

  zone_type = "forward"

  description = "Production DNS Zone"
}

output "dns_zone" {
  value = module.dns_zone.dns_zone
}
