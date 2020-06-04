FROM {{cookiecutter.container_registry}}/{{cookiecutter.repo_name}}-base:latest

COPY ./{{cookicutter.repo_name}} /app/{{cookiecutter.repo_name}}
COPY ./setup.py /app/setup.py

WORKDIR /app
RUN pip install .
