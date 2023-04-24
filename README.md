#Complete DevOps Project 1: Infrastructure Pipeline for Node.js Application

## Introduction
This guide walks through creating an infrastructure pipeline to deploy a Node.js application using Terraform, Jenkins, and Ansible. The application will be hosted on an EC2 instance within a private VPC and exposed on port 80 via an Application Load Balancer.

## Prerequisites 
- AWS account with appropriate permissions
- Terraform installed
- Jenkins installed
- Ansible installed 
- Git installed
- A sample Node.js application

## Step by Step Guide

### 1. Set up Terraform
Create a `main.tf` file to define your AWS infrastructure. 
Also create other infrastructure files,This includes:

- A VPC 
- Private and public subnets, route tables, and internet gateways, and NAT gateway
- ![Screenshot 2023-04-24 020131](https://user-images.githubusercontent.com/110028481/234050666-ae90832b-96b2-4eae-a271-097b214cafe6.png)
- Security groups for a bastion host and your application
- An EC2 instance for the bastion host, which will be used to access your private subnet
- An EC2 instance for your application server, running Amazon Linux 
- An Application Load Balancer to expose your application

### 2. Configure Jenkins to use the private subnet and bastion host
Create an SSH config file `~/.ssh/config` to proxy into your private subnet through the bastion host.

### 3. Configure Ansible
- Create an inventory file `inventory.ini` which will contain the IP address of your bastion host and application server (private subnet)
- Create a playbook `jenkins_master.yml` to configure your bastian server as a Jenkins master
![Screenshot 2023-04-23 163330](https://user-images.githubusercontent.com/110028481/234049480-38338ade-a4d2-4c23-82b0-6b93a9d3d5e4.png)
- Create a playbook `jenkins_slave.yml` to configure your application server as a Jenkins slave
![Screenshot 2023-04-23 233316](https://user-images.githubusercontent.com/110028481/234049972-8309128a-74c4-44e3-b789-0b9c5c442cfc.png)

### 4. Configure the slave in the Jenkins dashboard
Add a new node in the Jenkins dashboard pointing to your application server.
![Screenshot 2023-04-23 175221](https://user-images.githubusercontent.com/110028481/234049779-a2ef75f0-a57c-46fe-9368-187bc74673b2.png)
![Screenshot 2023-04-23 175118](https://user-images.githubusercontent.com/110028481/234049741-022d75e9-290b-4c3d-9f00-da748c189771.png)

### 5. Create a Jenkins pipeline to deploy your application
Create a `Jenkinsfile` in your Node.js application repository to:
- Check out code from the `main` branch
- build the docker image for the docker file in the repository
- The docker will: Install Node.js dependencies with `npm install` and start the application with `npm start` exposed on port 3000
- Jenkins will push the docker image to Docker Hub
- Jenkins slack notfier will send a notification in slack that the pipline is completed successfully and the docker image is pushed to docker hub
![Screenshot 2023-04-23 201825](https://user-images.githubusercontent.com/110028481/234050038-a87a129c-d7f3-4ae5-88af-dd02c3a4fb1b.png)
![Screenshot 2023-04-23 201920](https://user-images.githubusercontent.com/110028481/234050056-423a5818-c607-4323-8d25-6b7c42719fba.png)
![Screenshot 2023-04-24 002819](https://user-images.githubusercontent.com/110028481/234050108-d446c7da-85af-46ad-8650-29106a5da9c1.png)
![Screenshot 2023-04-24 002900](https://user-images.githubusercontent.com/110028481/234050141-93a87dd8-1afb-4105-bfd3-9b06737802e4.png)
![Screenshot 2023-04-24 004956](https://user-images.githubusercontent.com/110028481/234050452-bc08cb9c-4c0e-47b8-8457-c8e9f1784b68.png)

### 6. Run the container on the application server
- pull the docker image from Docker Hub
- run the docker image on the application server

### 7. Test your application
curl on your Application server URL to test connectivity.
![Screenshot 2023-04-24 015544](https://user-images.githubusercontent.com/110028481/234050580-1d212ef8-93db-4020-a0e9-995420915a61.png)

## Documentation
See the README.MD file for full documentation.
