output "container_app_name" {
  value = azurerm_container_app.app.name
}

output "container_app_url" {
  value = "https://${azurerm_container_app.app.ingress[0].fqdn}"
}
