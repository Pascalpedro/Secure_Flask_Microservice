# Use a base image with the latest version of Python
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# A blueprint for installing necessary dependencies and libs
COPY requirements.txt .

# Install the required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Python script into the container
COPY . .

# Use Nginx as the load balancer and Gunicorn to serve the Flask app and expose the port that the flask app will run on
RUN apt-get update && apt-get install -y nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
CMD ["bash", "-c", "nginx -g 'daemon off;' & gunicorn --bind 0.0.0.0:5000 app:app"]
