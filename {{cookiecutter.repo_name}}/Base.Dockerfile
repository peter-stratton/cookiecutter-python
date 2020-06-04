FROM python:3.8-alpine as base

FROM base as builder

RUN mkdir /install
WORKDIR /install

COPY requirements/base.txt /base.txt
COPY requirements/prod.txt /requirements.txt

RUN pip install --install-option="--prefix=/install" -r /requirements.txt

FROM base

COPY --from=builder /install /usr/local
