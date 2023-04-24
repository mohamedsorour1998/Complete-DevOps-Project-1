# DevOps Project 1: Infrastructure Pipeline for Node.js Application

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
- Security groups for a bastion host and your application
- An EC2 instance for the bastion host, which will be used to access your private subnet
- An EC2 instance for your application server, running Amazon Linux 
- An Application Load Balancer to expose your application

### 2. Configure Jenkins to use the private subnet and bastion host
Create an SSH config file `~/.ssh/config` to proxy into your private subnet through the bastion host.

### 3. Configure Ansible
- Create an inventory file `inventory.ini` which will contain the IP address of your bastion host and application server (private subnet)
- Create a playbook `jenkins_master.yml` to configure your bastian server as a Jenkins master
- Create a playbook `jenkins_slave.yml` to configure your application server as a Jenkins slave

### 4. Configure the slave in the Jenkins dashboard
Add a new node in the Jenkins dashboard pointing to your application server.

### 5. Create a Jenkins pipeline to deploy your application
Create a `Jenkinsfile` in your Node.js application repository to:

- Check out code from the `main` branch
- build the docker image for the docker file in the repository
- The docker will: Install Node.js dependencies with `npm install` and start the application with `npm start` exposed on port 3000
- Jenkins will push the docker image to Docker Hub

### 6. Run the container on the application server
- pull the docker image from Docker Hub
- run the docker image on the application server

### 7. Test your application
curl on your Application Load Balancer URL to test connectivity.

## Documentation
See the README.MD file for full documentation.