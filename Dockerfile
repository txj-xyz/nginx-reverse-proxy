# Use the official Nginx image as the base image
FROM nginx:latest

# Run nginx as root (yes i know this is not a good idea)
USER root

# Setup ENV variables for replacement
ENV NGINX_ENVSUBST_OUTPUT_DIR=/etc/nginx/conf.d

# --- PROXY SETTINGS ---
ENV LISTEN_HOST=example.com
ENV PROXY_PORT=8080
ENV PROXY_IP=127.0.0.1
# ----------------------

# Copy your SSL certificate and private key to the container
COPY ssl.crt /etc/nginx/certs/ssl.crt
COPY ssl.key /etc/nginx/certs/ssl.key

# Copy the Nginx configuration file into the template folder
RUN mkdir -p /etc/nginx/templates/
COPY nginx.conf.template /etc/nginx/templates/nginx.conf.template

# Expose port 443
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]