FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y \
        python-pip \
        python-dev

RUN apt-get install -y python-numpy python-lxml
RUN apt-get install -y python3 python3-pip python3-lxml python3-nose
RUN apt-get install -y python-nose
RUN locale-gen en_GB.UTF-8
RUN locale-gen fr_FR.UTF-8
RUN mkdir /home/nobody && \
    chown nobody /home/nobody
USER nobody
ENV HOME=/home/nobody \
    PATH=/home/nobody/.local/bin:$PATH \
    LANG=en_GB.UTF-8
# LANG needed for httpretty install on Py3
WORKDIR /home/nobody
RUN pip install --user https://github.com/okfn/messytables/archive/py23.zip
RUN pip3 install --user https://github.com/okfn/messytables/archive/py23.zip
RUN pip install --user pyhamcrest
RUN pip3 install --user pyhamcrest
COPY . /home/nobody/
