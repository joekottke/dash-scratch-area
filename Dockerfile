FROM debian:9.5-slim
RUN apt-get update 
RUN apt-get -y upgrade
RUN mkdir -p /usr/share/man/man1
RUN apt-get install -y python python-pip
RUN mkdir /app
COPY src/app.py /app
COPY requirements.txt /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
CMD [ "python", "./app.py" ]
