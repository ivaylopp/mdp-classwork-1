FROM alpine:latest

RUN apk update && apk add 'py3-pip>=23.1.2-r0'

COPY ./src /home/src

RUN pip3 install --no-cache-dir -r /home/src/requirements.txt --break-system-packages

CMD ["python3", "/home/src/app.py"]
