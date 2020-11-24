FROM ubuntu:20.04

WORKDIR /src
ADD ./functions-python-pytorch-tutorial /src

RUN apt-get update \
    && apt-get install curl  -y

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg

RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'

RUN apt-get update && apt-get install azure-functions-core-tools-3 -y

RUN apt-get install -y --no-install-recommends \
    python3 python3-dev python3-pip \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/local/bin/python && \
    ln -s /usr/bin/pip3 /usr/local/bin/pip

RUN pip install -r ./src/requirements.txt

EXPOSE 7071