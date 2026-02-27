variable "key_vault_name" {
  type        = string
  description = "Key Vault name (must be globally unique)"
}
variable "sql_server_name" { type = string }
variable "sql_database_name" { type = string }
variable "sql_admin_login" { type = string }
variable "sql_admin_password" {
  type      = string
  sensitive = true
}
variable "web_app_name" {
  type        = string
  description = "Web App name (must be globally unique)"
}
variable "vm_admin_username" { type = string }
variable "vm_admin_password" {
  type      = string
  sensitive = true
}