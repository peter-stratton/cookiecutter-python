variable module_tags {
  description = "Tags common to all resources in this module"
  default = {
    Project     = "{{cookiecutter.repo_name}}/terraform"
    GithubRepo  = "https://github.com/{{cookiecutter.github_org_name}}/{{cookiecutter.repo_name}}"
    ManagedBy   = "Terraform"
    TerraformIO = "https://app.terraform.io/app/{{cookiecutter.terraform_io_org}}/workspaces"
  }
}
