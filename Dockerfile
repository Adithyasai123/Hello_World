# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Create a non-root user
RUN useradd -m myuser
USER myuser

# Specify the command to run your Flask app with Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:9000", "app.py:app"]

