FROM python:3.8-slim

ENV TZ Europe/Moscow
ENV PYTHONDONTWRITEBYTECODE yes

RUN mkdir /app
ENV HOME=/app
ENV PYTHONPATH=$HOME
WORKDIR $HOME

COPY /configuration/requirements.txt .

RUN pip install  --no-cache-dir -r requirements.txt && rm requirements.txt

COPY /budgetter $HOME/budgetter
