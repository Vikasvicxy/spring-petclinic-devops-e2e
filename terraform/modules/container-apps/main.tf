resource "azurerm_log_analytics_workspace" "logs" {
  name                = "${var.container_app_name}-logs"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = "PerGB2018"
  retention_in_days = 30
}

resource "azurerm_container_app_environment" "environment" {
  name                = "${var.container_app_name}-environment"
  location            = var.location
  resource_group_name = var.resource_group_name

  log_analytics_workspace_id = azurerm_log_analytics_workspace.logs.id
}

resource "azurerm_container_app" "app" {
  name                         = var.container_app_name
  resource_group_name          = var.resource_group_name
  container_app_environment_id = azurerm_container_app_environment.environment.id

  revision_mode = "Single"

  template {
    min_replicas = 1
    max_replicas = 2

    container {
      name   = "petclinic"
      image  = var.image
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8080
    transport        = "auto"

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}
