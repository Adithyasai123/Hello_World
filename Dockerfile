# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Create a non-root user
RUN useradd -m myuser
USER myuser

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org Flask

# Make port 9000 available to the world outside this container
EXPOSE 9000

# Gunicorn: This is a popular WSGI (Web Server Gateway Interface) HTTP server for Python web applications. It's commonly used to serve web applications built using frameworks like Flask or Django.
CMD ["gunicorn", "-b", "0.0.0.0:9000", "app:app"]
