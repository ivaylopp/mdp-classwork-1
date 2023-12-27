FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3-pip

COPY ./src /home/src

RUN pip3 install -r /home/src/requirements.txt

CMD ["python3", "/home/src/app.py"]
