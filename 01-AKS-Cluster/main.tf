# # az aks create -n gautam -g gautam --load-balancer-sku standard --enable-private-cluster
# #  az aks create -n gautam -g 'gautam' -l 'uksouth' --network-plugin azure --enable-private-cluster --enable-apiserver-vnet-integration

provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.32.0"
    }
  }
}

resource "azurerm_resource_group" "example" {
  name     = "aks-rg4"
  location = "east us"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "aksdemo4"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"
  kubernetes_version = "1.24.6"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}