provider "github" {
  token = "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"
}

resource "github_repository" "repository-1" {
  name = "terraform_github"
  # repository = "terraform_github"
  #   branch = "master"
  visibility  = "public"
  description = "My first repository using terraform"
  auto_init   = true


}


resource "github_repository" "repository-2" {
  name = "terraform_github-2"
  # repository = "terraform_github"
  #   branch = "master"
  visibility  = "public"
  description = "My second repository using terraform"
  #   auto_init = true


}