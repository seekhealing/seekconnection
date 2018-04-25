PYTHON ?= python3
ifeq ($(origin VIRTUAL_ENV),undefined)
	DIST_PYTHON ?= pipenv run $(PYTHON)
else
	DIST_PYTHON ?= $(PYTHON)
endif

NAME = seekconnection
IMAGE_NAME ?= $(NAME)

.PHONY: dist dev devimage

dist:
	docker pull centos:7
	docker build --no-cache -t $(NAME) .

dev:
	pipenv --three install
	$(DIST_PYTHON) manage.py migrate
	$(DIST_PYTHON) manage.py runserver

devimage:
	docker pull centos:7
	docker build -t $(NAME) .
	docker rm seekconnection
	docker run -v $(PWD):/app --name seekconnection -p 8000:8000 $(NAME):latest

