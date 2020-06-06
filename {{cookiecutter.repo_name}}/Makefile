MODULE={{cookiecutter.repo_name}}
IMAGE={{cookiecutter.repo_name}}
REGISTRY={{cookiecutter.container_registry}}
BASE_DOCKERFILE=Base.Dockerfile
APP_DOCKERFILE=App.Dockerfile
TAG=latest
BLUE='\033[0;34m'
NC='\033[0m' # No Color

run:
	@python -m $(MODULE)

install:
	@pip install -U .

dev-install:
	@pip install -U -e .

test:
	@pytest --runslow

quick-test:
	@pytest

coverage: test
	@open ./reports/index.html

lint:
	@echo "\n${BLUE}Running linter against source files...${NC}\n"
	@flake8 ${MODULE} -v
	@echo "\n${BLUE}Running Bandit against source files...${NC}\n"
	@bandit -r ${MODULE}

clean:
	rm -rf .pytest_cache .coverage .pytest_cache coverage.xml

docker-login:
	@echo "\n${BLUE}Getting container registry creds...${NC}\n"
	{% if 'amazonaws' in cookiecutter.container_registry %}
	@aws ecr get-login --no-include-email | sh
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
