# Airtel Cloud DNS Zone Terraform Module

Terraform module for provisioning Airtel Cloud DNS Zones.

The module wraps the `airtelcloud_dns_zone` resource. Create DNS records in a zone with the [`dns-record`](https://github.com/Airtel-Cloud-Platform/terraform-airtelcloud-dns-record) module.

## Features

* Creates DNS Zones
* Supports Forward and Reverse DNS Zones
* Creates multiple zones with `for_each`
* Exposes every attribute exported by the provider (template, organization, creator and timestamps)

## Requirements

| Name                 | Version  |
| -------------------- | -------- |
| Terraform            | >= 1.5   |
| airtelcloud Provider | >= 1.0.4 |

## Usage

### Basic Example

```hcl
module "dns_zone" {
  source = "Airtel-Cloud-Platform/dns-zone/airtelcloud"

  zone_name = "example.com"
}
```

### Complete Example

```hcl
module "dns_zone" {
  source = "Airtel-Cloud-Platform/dns-zone/airtelcloud"

  zone_name = "example.com"

  zone_type = "forward"

  description = "Production DNS Zone"
}
```

### Multiple Zones

Use `for_each` to create several zones with the same module.

```hcl
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
  source   = "Airtel-Cloud-Platform/dns-zone/airtelcloud"
  for_each = local.zones

  zone_name   = each.value.zone_name
  zone_type   = "forward"
  description = each.value.description
}

output "zone_ids" {
  value = { for k, z in module.dns_zone : k => z.zone_id }
}
```

More examples are in [`examples/`](./examples): `basic`, `complete` and `multiple-zones`.

## Inputs

| Name        | Description                                                                          | Type     | Default     | Required |
| ----------- | ------------------------------------------------------------------------------------ | -------- | ----------- | -------- |
| zone_name   | DNS Zone name (for example `example.com`). Forces replacement if changed.            | `string` | n/a         | Yes      |
| zone_type   | DNS Zone type: `forward` or `reverse` (case-insensitive). Forces replacement if changed. | `string` | `"forward"` | No       |
| description | DNS Zone description. Updated in place.                                              | `string` | `null`      | No       |

## Outputs

| Name              | Description                                                         |
| ----------------- | ------------------------------------------------------------------- |
| zone_id           | DNS Zone ID (UUID)                                                  |
| zone_name         | DNS Zone Name                                                       |
| zone_type         | DNS Zone type                                                       |
| dns_zone_template | DNS zone template                                                   |
| org_name          | Organization name associated with the zone                          |
| org_id            | Organization ID associated with the zone                            |
| created_by        | User who created the zone                                           |
| created_at        | Creation timestamp (Unix timestamp)                                 |
| updated_at        | Last updated timestamp (Unix timestamp)                             |
| dns_zone          | Object with id, zone_name, zone_type, description, dns_zone_template, org_name, org_id, created_by, created_at and updated_at |

Example:

```hcl
output "zone_details" {
  value = module.dns_zone.dns_zone
}
```

## Import

The underlying resource can be imported by zone ID (UUID):

```shell
terraform import 'module.dns_zone.airtelcloud_dns_zone.this' <zone-id>
```

When the module is used with `for_each`:

```shell
terraform import 'module.dns_zone["primary"].airtelcloud_dns_zone.this' <zone-id>
```

After importing, run `terraform plan` to confirm the configuration matches the existing zone.
