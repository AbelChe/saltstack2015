FROM ubuntu:16.04

COPY src/entrypoint.sh /

RUN sed -i "s/archive.ubuntu.com/mirrors.163.com/g" /etc/apt/sources.list && \
    apt-get update && apt-get install -y wget && \
    echo 'deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/2015.8/ xenial main' >> /etc/apt/sources.list
RUN wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - && \
    apt-get update && \
    apt-get install -y salt-master salt-minion salt-ssh salt-syndic salt-cloud salt-api && \
    chmod +x /start.sh


EXPOSE 4505 4506

CMD ["/entrypoint.sh"]
