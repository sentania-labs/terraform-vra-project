terraform {
  required_providers {
    vra = {
      source  = "vmware/vra"
      version = ">= 0.15.0"
    }
  }
  required_version = ">= 1.14.0"
}
