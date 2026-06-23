variable "zone_name" {
  description = "DNS zone name"

  type = string

  validation {
    condition     = length(trim(var.zone_name, " ")) > 0
    error_message = "zone_name cannot be empty."
  }
}

variable "zone_type" {
  description = "DNS zone type"

  type    = string
  default = "forward"

  validation {
    condition = contains(
      ["forward", "reverse"],
      lower(var.zone_type)
    )

    error_message = "zone_type must be either 'forward' or 'reverse'."
  }
}

variable "description" {
  description = "DNS zone description"

  type    = string
  default = null
}