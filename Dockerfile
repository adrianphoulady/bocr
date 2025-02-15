FROM python:3.10-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git poppler-utils pandoc texlive-xetex texlive-fonts-recommended lmodern \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN pip install --break-system-packages --no-cache-dir .

CMD ["python", "-c", "import bocr; print('bOCR version:', bocr.__version__)"]
