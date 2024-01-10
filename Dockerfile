# Use the official Nginx image as the base image
FROM nginx:latest

# Run nginx as root (yes i know this is not a good idea)
USER root

# --- PROXY SETTINGS ---
ENV LISTEN_HOST=example.com
ENV PROXY_PORT=8080
ENV PROXY_IP=127.0.0.1
# ----------------------

# Copy your SSL certificate and private key to the container
COPY certs/ssl.crt /etc/nginx/certs/ssl.crt
COPY certs/ssl.key /etc/nginx/certs/ssl.key

# Create the templates directory
RUN mkdir -p /etc/nginx/templates/

# Copy the config tempalte for the env to handle
COPY templates/nginx.conf.template /etc/nginx/templates/nginx.conf.template

# Expose port 443
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]