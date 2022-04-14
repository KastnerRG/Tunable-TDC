from setuptools import setup, find_packages

import os

setup(name='burn',
      version='0.1',
      description='A PYNQ Package for power side-channel prototyping',
      author='Anon',
      author_email='anon@anon.com',
      license='BSD-3',
      packages=find_packages(),
      package_data={'':['*.bit', '*.tcl']},
)
