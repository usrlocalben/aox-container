FROM centos:7

COPY jam-x64 /usr/bin/jam

RUN yum -y install \
    openssl-devel \
    gcc-c++ \
    git \
    python3 \
    python3-devel

RUN python3 -m venv /venv
RUN /venv/bin/pip install circus

RUN git clone https://github.com/usrlocalben/aox

RUN cd /aox && \
    git fetch origin && \
    git checkout 23bb41b && \
    jam -sOPTIM='' -j2 install && \
    ln -sfn /usr/local/archiveopteryx/bin/aox /usr/local/bin/

EXPOSE 143 587 993 2026 4190

RUN mkdir /log
COPY entrypoint.sh /
COPY circus.ini.tpl /circus.ini.tpl
COPY archiveopteryx.conf.tpl /archiveopteryx.conf.tpl
COPY aoxsuper.conf.tpl /aoxsuper.conf.tpl
COPY genconfig.py /genconfig.py

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/venv/bin/circusd", "/circus.ini"]
