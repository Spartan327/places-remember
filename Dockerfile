FROM python:3.8

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

RUN mkdir /placesremember
WORKDIR /placesremember
COPY pyproject.toml poetry.lock /placesremember/

# Install dependencies:
ENV PATH="${PATH}:/root/.poetry/bin"
RUN poetry config virtualenvs.create false
RUN poetry install

# copy project
COPY ./placesremember /placesremember/