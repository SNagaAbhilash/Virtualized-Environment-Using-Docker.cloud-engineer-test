Objective:  Set up a basic virtualized environment using open-source tools like Docker.
--------------------------------------------------------------------------------------------------------
INTRODUCTION:
--------------------------------------------------------------------------------------------------
This project demonstrates how to set up a basic virtualized environment using Docker. We will create a Docker container running a simple web server using Nginx.

Prerequisites
------------------------------------------------------------------------------------------------
Before you begin, ensure you have the following:

1.Aws account: sign up at aws account

2.Docker installed on your machine.

3.Git (to push code to the repository).

Deployment Steps:
------------------------------------------------------------------------------------------------
1.LAUNCH AN EC2 INSTANCE

2.Log in to your AWS Management Console.

3.Navigate to the EC2 dashboard and click on "Launch Instance."

4.Choose an Amazon Machine Image (AMI). (e.g., Amazon Linux)

5.Select an instance type (e.g., t2.micro for free tier).

6.create vpc or you can use default vpc and subnets

7.Configure security group: Add a rule to allow SSH (port 22) from your IP and add 80 port number for nginx

8.Review and launch the instance.

9.Download the key pair (e.g., my-key.pem) when prompted.

2.CONNECT TO EC2 INSTANCE:
---------------------------------------------------------------------------------------------------
open your instance and connect using SSH client:

       ssh -i "web.pem" ec2-user@ec2-3-27-90-92.ap-southeast-2.compute.amazonaws.com

Getting Started
-------------------------------------------------------------------------------------------------
Follow these steps to create and run your Dockerized web application.

step1: create a directory and change the directory

   mkdir nginx-app
    cd nginx-app
   
Step 2: Directory Structure
Ensure your project directory contains the following structure to run the application using nginx


         nginx-app(directory)
          ├── Dockerfile
          ├── index.html
          ├── styles.css
          └── script.js

step3:Create the Dockerfile
The Dockerfile defines the environment for your web application. Create a file named Dockerfile with the following content:

FROM nginx
: This line specifies the base image for the Docker container. We are using the nginx:alpine image, which is a lightweight version of Nginx built on Alpine Linux. This helps to reduce the overall size of the container, making it faster to build and deploy.

             # Use the lightweight Nginx image based on Alpine Linux
                FROM nginx:alpine

MAINTAINER abhilash: This line indicates the maintainer of the Docker image. While this is not required, it is useful for documentation purposes, allowing others to know who to contact regarding the image.

              # Maintainer information
                 MAINTAINER abhilash

WORKDIR /usr/share/nginx/html: This command sets the working directory inside the container to the Nginx HTML directory. All subsequent commands (like COPY) will use this directory as the current working directory, simplifying file management.

                # working directory
             WORKDIR /usr/share/nginx/html

COPY index.html /usr/share/nginx/html/index.html: This command copies the index.html file from your local directory into the specified path in the container. This file will be served as the main webpage.
COPY style.css /usr/share/nginx/html/style.css: This line copies the style.css file into the same directory, allowing us to apply styles to our HTML page.
COPY script.js /usr/share/nginx/html/script.js: This line copies the script.js file, which will handle any JavaScript functionality on the webpage.

             # Copy the static files into the container
             COPY index.html /usr/share/nginx/html/index.html
             COPY style.css /usr/share/nginx/html/style.css
             COPY script.js /usr/share/nginx/html/script.js

EXPOSE 80: This instruction informs Docker that the container will listen on port 80. While this does not actually publish the port, it serves as documentation and allows other tools to understand which ports are intended to be exposed.

              # Expose the port that Nginx listens on
                  EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]: This command runs Nginx when the container starts. The -g "daemon off;" option keeps Nginx running in the foreground, which is essential for Docker containers to keep running continuously. This ensures that the Nginx process does not exit after starting.


               # Default command to run Nginx
               CMD ["nginx", "-g", "daemon off;"]

step4: Create the HTML, CSS, and JavaScript Files

  to create a basic application but functional we create by using htmm,css and java scipt in the same directory


Step 5: Build the Docker Image
In project directory run the following command to build the Docker image:

               docker build -t nginx-app .

step6:Run the Docker Container
After the image is built, run the Docker container using:
This command starts the container in detached mode (-d) and maps port 80 of the container to port 8080 on your host machine.

               docker run -d -p 8080:80 nginx-app

Step 7: Access the Web Application
Open your web browser and go to http://localhost:8080. You should see your web application. 
Click the "Click Me!" button to see the interaction.

Step 8: Stopping the Container
To stop the running container, find its ID:

                docker ps
                
Then stop the container using:

                docker stop <container_id>

Step 9: Cleanup
To remove the container and the image, run:

                 docker rm <container_id>
                 docker rmi my-web-app


conclusion:
-----------------------------------

You have successfully set up a Dockerized web application using Nginx to serve static files. you can also expand the application by adding more features, styles, or JavaScript functionality!
                


