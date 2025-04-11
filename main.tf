
# Add a user to the organization
resource "github_repository" "mtc_repo" {
  name        = "mtc-repo"
  description = "This is a test repository"
  visibility  = "private"
  auto_init   = true

}

resource "github_repository_file" "index-html" {
  repository          = github_repository.mtc_repo.name
  branch              = "main"
  file                = "index.html"
  content             = "Hello terraform!"
  overwrite_on_create = true
}

resource "github_repository_file" "readme" {
  repository          = github_repository.mtc_repo.name
  branch              = "main"
  file                = "README.md"
  content             = "# This repos is for infra developer"
  overwrite_on_create = true
}