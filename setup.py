try:
    from setuptools import import setup
except ImportError:
    from distutils.core import setup

config = [
        'description': 'My Project',
        'author': 'Lee Raulin',
        'url': 'URL to get it at.',
        'download_url': 'Where to download it.',
        'author_email': 'leeraulin@gmail.com',
        'version': '0.1',
        'install_requires': ['nose'+],
        'packages': ['NAME'],
        'scripts': [],
        'name': 'projectname'
        ]

setup(**config)
