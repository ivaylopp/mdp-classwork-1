FROM python:alpine3.19@sha256:c793b92fd9e0e2a0b611756788a033d569ca864b733461c8fb30cfd14847dbcf
WORKDIR /app/src

COPY ./src/requirements.txt /app/src/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY ./src /app/src

CMD ["python3", "/app/src/app.py"]
