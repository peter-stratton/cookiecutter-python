# -*- coding: utf-8 -*-
import {{cookiecutter.repo_name}}
from {{cookiecutter.repo_name}}.app import main


def test_version():
    assert {{cookiecutter.repo_name}}.__version__ == '0.1.0'

def test_{{cookiecutter.repo_name}}_main(capsys):
    main()
    captured = capsys.readouterr()
    assert 'Welcome to {{cookiecutter.repo_name}} - v{{cookiecutter.version}}' in captured.out
