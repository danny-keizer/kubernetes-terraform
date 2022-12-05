variable "clusterName" {
  description = "Cluster name"
  type = string
}

variable "sku" {
  description = "VM instance type"
  type = string
}

variable "region" {
  description = "Azure region"
  type = string
}

variable "nodes" {
  description = "Node count"
  type = number
}

variable "diskSize" {
  description = "Size of worker node disk in GB"
  type = number
}

variable "nsName" {
  description = "Application namespace"
  type = string
}