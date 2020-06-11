FROM python:3.8-alpine as base

FROM base as builder

RUN apk add libffi-dev openssl-dev python3-dev build-base

COPY requirements/base.txt /base.txt
COPY requirements/prod.txt /requirements.txt

RUN pip install --user -r /requirements.txt

FROM base
COPY --from=builder /root/.local /root/.local
