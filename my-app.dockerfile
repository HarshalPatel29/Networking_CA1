#using the official Python 3.9 slim image as the base image.

FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Copy files
COPY cloudformation-ansible.json ./app

# Set working directory
WORKDIR /app

# Install Python dependencies
RUN pip install -r packages.txt

# Expose port
EXPOSE 80

# Run command
CMD ["python", "(demo-app.py)"]
