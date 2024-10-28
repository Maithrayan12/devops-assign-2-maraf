# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /Auctions-Django-Project

# Copy the entire project to the container
COPY . /Auctions-Django-Project

# Create a new virtual environment inside the container
RUN python -m venv /Auctions-Django-Project/venv

# Install dependencies using the new virtual environment's pip
RUN /Auctions-Django-Project/venv/bin/pip install -r /Auctions-Django-Project/requirements.txt

# Expose port 8000 for the Django app
EXPOSE 8000

# Run the Django server using the newly created virtual environment
CMD ["/Auctions-Django-Project/venv/bin/python", "/Auctions-Django-Project/Auctions-Django-Project/manage.py", "runserver", "0.0.0.0:8000"]
