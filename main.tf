
# Add a user to the organization
resource "github_repository" "mtc_repo" {
  name        = "mtc-repo"
  description = "This is a test repository"
  visibility  = "private"
  auto_init   = true

}