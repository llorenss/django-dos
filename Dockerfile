FROM python:3.10-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install poetry && poetry config virtualenvs.create false

COPY poetry.lock pyproject.toml ./

RUN poetry install

COPY src ./

COPY entrypoint.sh ./

ENTRYPOINT ["./entrypoint.sh"]
