resource "random_id" "random" {
  byte_length = 2
  count       = var.repo_count
}
# Add a user to the organization
resource "github_repository" "mtc_repo" {
  count       = var.repo_count
  name        = "mtc-repo-${random_id.random[count.index].dec}"
  description = "This is a test repository"
  visibility  = "private"
  auto_init   = true
}

resource "github_repository_file" "index-html" {
  count               = var.repo_count
  repository          = github_repository.mtc_repo[count.index].name
  branch              = "main"
  file                = "index.html"
  content             = "Hello terraform!"
  overwrite_on_create = true
}

resource "github_repository_file" "readme" {
  count               = var.repo_count
  repository          = github_repository.mtc_repo[count.index].name
  branch              = "main"
  file                = "README.md"
  content             = "# This repos is for infra developer"
  overwrite_on_create = true
}

output "clone_urls" {
  value = {
    for index in github_repository.mtc_repo[*] : index.name => index.https_clone_url
  }
  description = "repository names"
  sensitive   = false
}