import sys

from setuptools import setup, find_packages
from setuptools.command.test import test as TestCommand


class PyTest(TestCommand):
    user_options = [('pytest-args=', 'a', 'Arguments to pass to py.test')]

    def initialize_options(self):
        TestCommand.initialize_options(self)
        self.pytest_args = []

    def finalize_options(self):
        TestCommand.finalize_options(self)
        self.test_args = []
        self.test_suite = True

    def run_tests(self):
        import pytest
        errno = pytest.main(self.pytest_args)
        sys.exit(errno)

setup(
    name='{{cookiecutter.repo_name}}',
    version='{{cookiecutter.version}}',
    author='{{cookiecutter.full_name}}',
    author_email='{{cookiecutter.email}}',
    description='{{cookiecutter.short_description}}',
    packages=find_packages(),
    install_requires=[],
    {% if cookiecutter.command_line_interface not in ['none'] %}
    entry_points={
        'console_scripts': [
            '{{cookiecutter.repo_name}} = {{cookiecutter.repo_name}}.app:main'
        ]
    },
    {% endif %}
    tests_require=['pytest'],
    cmdclass={'test':PyTest},
)
