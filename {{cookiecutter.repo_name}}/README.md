{{cookiecutter.repo_name}}
=====

{{cookiecutter.short_description}}

Developer Setup
---------------
Create the virtual environment
```
mkvirtualenv {{cookiecutter.repo_name}} && setvirtualenvproject
```
Upgrade pip and install the dependencies
```
pip install -U pip
pip install -r requirements/dev.txt
```
Install `{{cookiecutter.repo_name}}` in editable mode
```
make dev-install
```
Run the tests
```
make test
```

Skaffold Dev
------------
First, install [skaffold](https://skaffold.dev/). Next, run the following comand which will
clear out your local tags (hopefully they'll fix this soon) and start skaffold in dev mode.
```
make dev-skaffold
```

Creating a Release
----------------
1 - Move the `[unreleased]` CHANGELOG section to a version section

2 - Commit and push the CHANGELOG

3 - Bump the version using the appropriate \<part> (major, minor, or patch)
```
bumpversion <part>
```
4 - Deploy a new container with the new release number as the TAG
```
make docker-deploy-{{cookiecutter.repo_name}} TAG=x.x.x
```
