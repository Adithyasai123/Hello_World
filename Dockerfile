# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Install Gunicorn
RUN pip install gunicorn

# Change ownership of the /app directory to the myuser user
RUN chown -R myuser:myuser /app

# Give myuser user write permissions to /app
RUN chmod -R u+w /app

# Create a non-root user
RUN useradd -m myuser
USER myuser

# Specify the absolute path to run your Flask app with Gunicorn
CMD ["/usr/local/bin/gunicorn", "-b", "0.0.0.0:9000", "app.py:app"]
