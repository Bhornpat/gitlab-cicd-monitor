FROM python:3.11-slim

LABEL Name="Python Flask Demo App"
LABEL org.opencontainers.image.source = "https://github.com/Bhornpat/gitlab-cicd-monitor"

ARG srcDir=src
WORKDIR /app

# ✅ Install build dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python deps
COPY $srcDir/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY $srcDir/run.py .
COPY $srcDir/app ./app

EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:5000", "run:app"]

