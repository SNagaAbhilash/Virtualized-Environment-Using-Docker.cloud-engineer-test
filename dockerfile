FROM nginx:alpine

MAINTAINER abhilash

# working directory
WORKDIR /usr/share/nginx/html

# Copy the static files into the container
COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css
COPY script.js /usr/share/nginx/html/script.js

# Expose the port that Nginx listens on
EXPOSE 80

# Default command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
