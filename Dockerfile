FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python2.7 python-dev python-pip python-virtualenv && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt

RUN pip2 install --upgrade pip
RUN pip2 install -r requirements.txt

WORKDIR /notebook
RUN python --version
RUN pip2 list

RUN jupyter notebook --generate-config
CMD jupyter notebook --ip=0.0.0.0 --no-browser --allow-root
