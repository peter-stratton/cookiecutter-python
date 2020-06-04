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
Run the tests
```
make test
```
