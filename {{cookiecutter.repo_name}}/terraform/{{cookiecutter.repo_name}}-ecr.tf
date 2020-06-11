# {{cookiecutter.repo_name}} ECR Repos
resource "aws_ecr_repository" "{{cookiecutter.repo_name}}-base-ecr" {
  name = "{{cookiecutter.repo_name}}-base"

  tags = merge(
  var.module_tags,
  map(
  "Name", "{{cookiecutter.repo_name}}-base-container-registry")
  )
}

resource "aws_ecr_repository" "{{cookiecutter.repo_name}}-ecr" {
  name = "{{cookiecutter.repo_name}}"

  tags = merge(
  var.module_tags,
  map(
  "Name", "{{cookiecutter.repo_name}}-container-registry")
  )
}
