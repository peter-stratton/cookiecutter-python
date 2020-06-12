FROM python:3.8-alpine as base

FROM base as builder

RUN apk update && apk add build-base python3-dev gcc

COPY requirements/base.txt /base.txt
COPY requirements/prod.txt /requirements.txt

RUN pip install -U pip
RUN pip install --user -r /requirements.txt

FROM base
COPY --from=builder /root/.local /root/.local
