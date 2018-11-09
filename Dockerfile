FROM python:3-slim

COPY requirements.txt /requirements.txt

RUN pip install gunicorn -r requirements.txt \
  && python -m textblob.download_corpora

COPY . /src

CMD gunicorn -b :5000 --chdir /src app:app
