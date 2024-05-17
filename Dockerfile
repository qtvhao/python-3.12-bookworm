FROM ghcr.io/qtvhao/node-20.12.2:main

ENV PYTHON_URL https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tar.xz
RUN set -xe; \
    apt-get update; \
    curl -fsSL -o python.tar.xz "$PYTHON_URL"; \
    tar -xf python.tar.xz --strip-components=1 -C /usr/local; \
    rm python.tar.xz; \
    which python3; \
    apt-get install -y --no-install-recommends \
        python3-pip \
        python3-venv; \
    apt-get autoremove -y; \
    apt-get autoclean -y; \
    apt-get clean -y; \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* /tmp/* /var/tmp/* /usr/local/src/*; \
    which pip3;
COPY requirements.txt /app/
RUN python3 -m venv venv
RUN . venv/bin/activate && pip3 install --no-cache-dir -r requirements.txt

COPY app.js .
RUN node app.js
