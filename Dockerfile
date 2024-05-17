FROM ghcr.io/qtvhao/debian:main

COPY requirements.txt /app/
RUN . venv/bin/activate && pip install --no-cache-dir -r requirements.txt
