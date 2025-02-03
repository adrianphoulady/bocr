FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends libgl1 libglib2.0-0 poppler-utils pandoc && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN pip install . --break-system-packages

CMD ["python", "-c", "import bocr; print('bOCR version:', bocr.__version__)"]
