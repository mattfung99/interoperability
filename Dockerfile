# syntax=docker/dockerfile:1
FROM python:3.8-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache g++ musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip install flask_cors
EXPOSE 5000
COPY . .
CMD ["flask", "run"]