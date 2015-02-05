#!/usr/bin/env python
from setuptools import setup

setup(
    name='psx',
    version='0.01',
    author='Elliot Briggs',
    description='Python implementation of spesmilo/sx bitcoin tool',
    url='https://github.com/hamgravy/psx',
    zip_safe=False,
    scripts=['psx'],
    install_requires=['mnemonic','scrypt','pycrypto','ecdsa','hashlib','hmac'],
    classifiers=[
        'License :: OSI Approved :: MIT License',
        'Operating System :: POSIX :: Linux',
        'Operating System :: Microsoft :: Windows',
        'Operating System :: MacOS :: MacOS X',
    ],
)
