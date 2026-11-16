module "dns_zone" {
  source = "../../"

  zone_name = "example.com"
}

output "zone_id" {
  value = module.dns_zone.zone_id
}
