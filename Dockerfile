# using a Multi-stage Dockerfile
FROM python:3.9-alpine

# keeps python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

# we lock a poetry version
ENV POETRY_VERSION=1.1.0

# install dev dependencies
RUN apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev \
	openssl-dev libffi-dev curl

# install and setup poetry
RUN pip install -U pip \
    && pip install "poetry==$POETRY_VERSION" && poetry --version

ENV PATH="${PATH}:/root/.poetry/bin"

WORKDIR /usr/src/app
COPY . .

# Install poetry dependencies
RUN poetry install

# delete temporary requirements for postgres
RUN apk del .tmp-build-deps

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
