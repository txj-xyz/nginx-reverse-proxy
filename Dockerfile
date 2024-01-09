# Use the official Nginx image as the base image
FROM nginx:latest


# Setup ENV variables for replacement
ENV NGINX_ENVSUBST_OUTPUT_DIR=/etc/nginx/sites-enabled

# --- PROXY SETTINGS ---
ENV LISTEN_HOST=example.com
ENV PROXY_PORT=8080
ENV PROXY_IP=127.0.0.1
# ----------------------

# Remove the default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy your SSL certificate and private key to the container
COPY ssl.crt /etc/nginx/certs/ssl.crt
COPY ssl.key /etc/nginx/certs/ssl.key

# Copy the Nginx configuration file
COPY nginx.conf.template /etc/nginx/templates/nginx.conf.template

# Expose port 443
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
