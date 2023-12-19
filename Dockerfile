FROM python:3.8-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install gunicorn

EXPOSE 9000

CMD ["/usr/local/bin/gunicorn", "-b", "0.0.0.0:9000", "app.py:app"]
