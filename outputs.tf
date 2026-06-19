output "zone_id" {
  description = "DNS Zone ID"

  value = airtelcloud_dns_zone.this.id
}

output "zone_name" {
  description = "DNS Zone Name"

  value = airtelcloud_dns_zone.this.zone_name
}

output "dns_zone" {
  description = "Complete DNS Zone object"

  value = {
    id        = airtelcloud_dns_zone.this.id
    zone_name = airtelcloud_dns_zone.this.zone_name
  }
}
