FROM python:3.12-slim-bookworm

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        openssh-client \
    && rm -rf /var/lib/apt/lists/* \
    && python3 -v -m pip install --no-cache-dir ansible

COPY requirements.yml /code/

RUN ansible-galaxy install -r requirements.yml