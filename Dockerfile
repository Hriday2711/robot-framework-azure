FROM mcr.microsoft.com/playwright/python:latest

# Playwright base includes Python, Playwright and browser binaries.
ENV PYTHONUNBUFFERED=1
WORKDIR /app

# Install Python dependencies from Requirements.txt (Playwright already bundled)
COPY Requirements.txt /app/Requirements.txt
RUN pip install --no-cache-dir -r /app/Requirements.txt

# Copy repository files
COPY . /app

# Default command runs Robot Framework tests in the Tests/ directory
CMD ["robot", "Tests/"]
