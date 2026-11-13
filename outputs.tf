output "zone_id" {
  description = "DNS Zone ID"

  value = airtelcloud_dns_zone.this.id
}

output "zone_name" {
  description = "DNS Zone Name"

  value = airtelcloud_dns_zone.this.zone_name
}

output "zone_type" {
  description = "DNS Zone type (forward or reverse)"

  value = airtelcloud_dns_zone.this.zone_type
}

output "dns_zone_template" {
  description = "DNS zone template"

  value = airtelcloud_dns_zone.this.dns_zone_template
}

output "org_name" {
  description = "Organization name associated with the zone"

  value = airtelcloud_dns_zone.this.org_name
}

output "org_id" {
  description = "Organization ID associated with the zone"

  value = airtelcloud_dns_zone.this.org_id
}

output "created_by" {
  description = "User who created the zone"

  value = airtelcloud_dns_zone.this.created_by
}

output "created_at" {
  description = "Zone creation timestamp (Unix timestamp)"

  value = airtelcloud_dns_zone.this.created_at
}

output "updated_at" {
  description = "Zone last updated timestamp (Unix timestamp)"

  value = airtelcloud_dns_zone.this.updated_at
}

output "dns_zone" {
  description = "Complete DNS Zone object with all exported attributes"

  value = {
    id                = airtelcloud_dns_zone.this.id
    zone_name         = airtelcloud_dns_zone.this.zone_name
    zone_type         = airtelcloud_dns_zone.this.zone_type
    description       = airtelcloud_dns_zone.this.description
    dns_zone_template = airtelcloud_dns_zone.this.dns_zone_template
    org_name          = airtelcloud_dns_zone.this.org_name
    org_id            = airtelcloud_dns_zone.this.org_id
    created_by        = airtelcloud_dns_zone.this.created_by
    created_at        = airtelcloud_dns_zone.this.created_at
    updated_at        = airtelcloud_dns_zone.this.updated_at
  }
}
