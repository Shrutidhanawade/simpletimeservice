FROM python:3.11-slim

# Create non-root user
RUN useradd -m appuser

# Set work directory
WORKDIR /app

# Copy files
COPY app/ ./app/
COPY /app/requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Use non-root user
USER appuser

# Expose and run
EXPOSE 5000
CMD ["python", "app/main.py"]

