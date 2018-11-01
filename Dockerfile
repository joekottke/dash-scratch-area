FROM debian:9.5-slim as builder
RUN apt-get update 
RUN apt-get -y upgrade
RUN mkdir -p /usr/share/man/man1
RUN apt-get install -y python python-pip build-essential libffi-dev curl openjdk-8-jdk-headless
WORKDIR /appbuild
COPY . /appbuild
RUN ls -la
RUN ./pants binary src:

FROM debian:9.5-slim
RUN apt-get update 
RUN apt-get -y upgrade
RUN mkdir -p /usr/share/man/man1
RUN apt-get install -y python python-pip
RUN mkdir /app
COPY --from=builder /appbuild/dist/*.pex /app
CMD ["/app/dash-scratch.pex"]
