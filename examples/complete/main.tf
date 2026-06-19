module "dns_zone" {
  source = "../../"

  zone_name = "example.com"

  zone_type = "forward"

  description = "Production DNS Zone"
}
