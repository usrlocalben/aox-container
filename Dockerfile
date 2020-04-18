FROM fedora:31

COPY jam-x64 /usr/bin/jam

RUN dnf -y install \
    clang \
    compat-openssl10-devel \
    gcc-c++ \
    git \
    python3 \
    python3-devel

# RUN dnf -y install \
#     the_silver_searcher \
#     vim \
#     zsh \
#     tmux \
#     patch \
#     findutils \
#     procps

RUN python3 -m venv /venv && \
    /venv/bin/pip install circus

RUN git clone https://github.com/usrlocalben/aox && \
    cd /aox && \
    CLANG=clang jam -j4 install && \
    ln -sfn /usr/local/archiveopteryx/bin/aox /usr/local/bin/

EXPOSE 143 587 993 2026 4190

COPY entrypoint.sh /
COPY circus.ini.tpl /circus.ini.tpl
COPY archiveopteryx.conf.tpl /archiveopteryx.conf.tpl
COPY genconfig.py /genconfig.py

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/venv/bin/circusd", "/circus.ini"]
