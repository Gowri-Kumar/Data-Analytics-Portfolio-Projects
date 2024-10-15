# configure git user credentials to databricks
resource "databricks_git_credential" "MyGitCreds" {
  git_username = "Gowri-Kumar"
  git_provider = "github"
  personal_access_token = var.MyGitPAT
}


# configure git repo
resource "databricks_repo" "MyRepo" {
  url = var.MyGitRepoURL
}