FROM alpine:3.19

RUN apk update && apk --no-cache add 'py3-pip>=23.1.2-r0'

COPY ./src/requirements.txt /home/src/requirements.txt
RUN pip3 install --no-cache-dir -r /home/src/requirements.txt --break-system-packages

COPY ./src /home/src

CMD ["python3", "/home/src/app.py"]
