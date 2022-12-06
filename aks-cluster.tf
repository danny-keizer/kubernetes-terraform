resource "azurerm_resource_group" "default" {
  name     = "${var.clusterName}rg"
  location = var.region
  tags = {
    environment = "Lab"
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "${var.clusterName}aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${var.clusterName}-k8s"

  default_node_pool {
    name                = "${var.clusterName}pool"
    node_count          = var.nodes
    vm_size             = var.sku
    os_disk_size_gb     = var.diskSize
    enable_host_encryption = true
    type                = "VirtualMachineScaleSets"
    zones               = ["1", "2"]
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  http_application_routing_enabled = true
    
  
  tags = {
    environment = "Lab"
  }
}

resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.default]
  filename     = "${path.cwd}/${var.clusterName}.yml"
  content      = azurerm_kubernetes_cluster.default.kube_config_raw
}