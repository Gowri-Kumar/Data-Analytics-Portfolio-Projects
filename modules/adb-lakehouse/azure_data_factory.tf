resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = local.rg_location
  resource_group_name = local.rg_name
  tags                = var.tags
  github_configuration {
    account_name = var.MyGitHubAcctName
    branch_name = "main"
    git_url = "https://github.com"
    repository_name = var.MyGitHubRepoName
    root_folder = "adf"
}
}