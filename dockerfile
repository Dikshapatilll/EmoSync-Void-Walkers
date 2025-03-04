# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install dependencies
RUN apt-get update && apt-get install -y cmake
RUN pip install --no-cache-dir scikit-build
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Run manage.py when the container launches
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]

