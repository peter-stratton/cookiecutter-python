FROM {{cookiecutter.container_registry}}/{{cookiecutter.repo_name}}-base:latest

ENV PATH=/root/.local/bin:$PATH

COPY ./{{cookiecutter.repo_name}} /app/{{cookiecutter.repo_name}}
COPY ./setup.py /app/setup.py

WORKDIR /app
RUN pip install -U pip
RUN pip install --user .
