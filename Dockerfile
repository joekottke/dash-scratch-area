FROM debian:9.5-slim
RUN apt-get update 
RUN apt-get -y upgrade
RUN mkdir -p /usr/share/man/man1
RUN apt-get install -y python3 python3-pip
RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app
RUN pip3 install --no-cache-dir -r requirements.txt
COPY src/app.py /app
CMD [ "python3", "./app.py" ]
