FROM nginx:alpine

MAINTAINER abhilash

# working directory
WORKDIR /usr/share/nginx/html

# Copy the static files into the container
COPY ./application/ .

# Expose the port that Nginx listens on
EXPOSE 80

# Default command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
