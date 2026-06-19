resource "airtelcloud_dns_zone" "this" {
  zone_name = var.zone_name

  zone_type = lower(var.zone_type)

  description = var.description
}
