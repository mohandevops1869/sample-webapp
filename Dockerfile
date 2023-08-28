# Use the official Python image as the base image
FROM python:3.8

# Set the working directory
WORKDIR /app

# Install NGINX, Netstat, and Vim
RUN apt-get update && apt-get install -y \
    nginx \
    net-tools \
    vim

# Copy the Python application files into the container
COPY app.py /app/

# Install Flask
RUN pip install Flask
ENTRYPOINT FLASK_APP=/app/app.py flask run --host=0.0.0.0 --port=8080
