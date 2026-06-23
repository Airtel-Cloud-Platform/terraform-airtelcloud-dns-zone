# Airtel Cloud DNS Zone Terraform Module

Terraform module for provisioning Airtel Cloud DNS Zones.

## Features

* Creates DNS Zones
* Supports Forward and Reverse DNS Zones
* Exposes DNS Zone outputs for downstream modules

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

## Inputs

| Name        | Description                            | Type   | Required |
| ----------- | -------------------------------------- | ------ | -------- |
| zone_name   | DNS Zone name                          | string | Yes      |
| zone_type   | DNS Zone type (`forward` or `reverse`) | string | No       |
| description | DNS Zone description                   | string | No       |

## Outputs

| Name      | Description              |
| --------- | ------------------------ |
| zone_id   | DNS Zone ID              |
| zone_name | DNS Zone Name            |
| dns_zone  | Complete DNS Zone object |

## Requirements

| Name                 | Version  |
| -------------------- | -------- |
| Terraform            | >= 1.5   |
| airtelcloud Provider | >= 1.0.4 |

