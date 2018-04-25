FROM centos:7
RUN yum -y install epel-release && \
    yum -y install python36 which && \
    yum clean all && \
    curl https://bootstrap.pypa.io/get-pip.py | python36 && \
    pip3 install --no-cache-dir pipenv dumb-init && \
    useradd -m -U django && \
    mkdir /app && \
    chown -R django:django /app
ENV PYTHON_VERSION=3.6 \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    PIP_NO_CACHE_DIR=off
COPY . /app
WORKDIR /app
USER django
RUN pipenv install && \
    pipenv run python manage.py collectstatic --no-input
CMD ["sh", "/app/run_django.sh"]
ENTRYPOINT ["dumb-init", "--"]
