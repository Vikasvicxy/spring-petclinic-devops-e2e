output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "acr_name" {
  value = module.acr.acr_name
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "container_app_url" {
  value = module.container_apps.container_app_url
}

output "aks_name" {
  value = module.aks.aks_name
}
