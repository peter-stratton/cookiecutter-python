output {{cookiecutter.repo_name}}-base-repo-url {
  description = "{{cookiecutter.repo_name}}-base repository URL"
  value       = aws_ecr_repository.{{cookiecutter.repo_name}}-base-ecr.repository_url
}

output {{cookiecutter.repo_name}}-repo-url {
  description = "{{cookiecutter.repo_name}} repository URL"
  value       = aws_ecr_repository.{{cookiecutter.repo_name}}-ecr.repository_url
}
