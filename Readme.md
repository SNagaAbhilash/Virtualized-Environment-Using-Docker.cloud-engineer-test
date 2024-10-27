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

7.Configure security group: Add a rule to allow SSH (port 22) from your IP. Add a rule to allow traffic on the port your application will run (e.g., port 8080 for tomcat).

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














