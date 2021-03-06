MODULE={{cookiecutter.repo_name}}
IMAGE={{cookiecutter.repo_name}}
REGISTRY={{cookiecutter.container_registry}}
BASE_DOCKERFILE=Base.Dockerfile
APP_DOCKERFILE=Dockerfile
TAG=latest
BLUE=\033[0;34m
NC=\033[0m # No Color

run:
	@python -m $(MODULE)

install:
	@pip install -U .

dev-install:
	@pip install -U -e .

dev-skaffold: docker-deploy-base
	@git tag -d $(git tag -l)
	@skaffold dev

test:
	@pytest --runslow

quick-test:
	@pytest

coverage: test
	@open ./reports/index.html

lint:
	@echo "\n${BLUE}Lint and Score Maintainability${NC}\n"
	@flake8 ${MODULE} --radon-max-cc 10 && radon mi ${MODULE}
	@echo "\n${BLUE}Bandit Security Audit${NC}\n"
	@bandit -r ${MODULE}

clean:
	rm -rf .pytest_cache .coverage .pytest_cache coverage.xml

docker-login:
	@echo "\n${BLUE}Getting container registry creds...${NC}\n"
	{% if 'amazonaws' in cookiecutter.container_registry %}
	@aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $(REGISTRY)
	{% else %}
	@docker login
	{% endif %}

docker-build-base:
	@echo "\n${BLUE}Building ${MODULE}-base${NC}\n"
	@docker build -t $(IMAGE)-base:$(TAG) -t $(REGISTRY)/$(IMAGE)-base:$(TAG) -t $(IMAGE)-base:latest -t $(REGISTRY)/$(IMAGE)-base:latest -f $(BASE_DOCKERFILE) .

docker-deploy-base: docker-login docker-build-base
	@docker push $(REGISTRY)/$(IMAGE)-base:$(TAG)
	@docker push $(REGISTRY)/$(IMAGE)-base:latest

docker-build-app: docker-deploy-base
	@echo "\n${BLUE}Building ${MODULE}${NC}\n"
	@docker build -t $(IMAGE):$(TAG) -t $(REGISTRY)/$(IMAGE):$(TAG) -t $(IMAGE):latest -t $(REGISTRY)/$(IMAGE):latest -f $(APP_DOCKERFILE) .

docker-deploy-app: docker-build-app
	@docker push $(REGISTRY)/$(IMAGE):$(TAG)
	@docker push $(REGISTRY)/$(IMAGE):latest

.PHONY: run install dev-install test coverage lint clean docker-login docker-build-base docker-deploy-base docker-build-app docker-deploy-app
