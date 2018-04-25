SeekConnection
==============

To develop against SeekConnection, you need:

  1. Python 3.6
  2. Pipenv (https://pipenv.readthedocs.io/)
  3. Docker

The `Makefile` has the following commands:

  * `make dist` - Makes an image ready to deploy to the cloud
  * `make dev` - Builds a developer's environment locally and runs it
  * `make devimage` - Builds a container image and runs it locally for development
