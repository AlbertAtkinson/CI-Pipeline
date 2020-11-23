# DevOps CI-Pipeline Practical Project

## Brief

Overall Objective:
Deploy a simple flask application with a completed CI Pipeline with full documentation around the utilisation of supporting tools. Application must:

- Be deployed to a **Virtual Machine for testing**
- Be deployed in a **managed Kubernetes Cluster for production**
- Make use of a **managed Database solution**
- **Continuously test and deploy the application when changes are made**

## Requirements

The requirements of the project are as follows:

* A Jira board with full expansion on tasks needed to complete the project.
* The application must be deployed using containerisation and orchestration tools (docker and kubernetes).
* The application must be tested through the CI pipeline.
* The project must make use of two managed Database Servers: 1 for Testing and 1 for Production.
* If a change is made to the code base, Webhooks should be used so that Jenkins recreates and redeploys the changed application.
* The infrastructure for the project should be configured using an infrastructure management tool (Infrastructure as Code).
* As part of the project, you need to create an Ansible Playbook that will provision the environment that your CI Server needs to run.
* The project must make use of a reverse proxy to make your application accessible to the user.

## Architecture
### Infrastructure
Pictured below is the MVP structure for the project with a manual kubernetes cluster and test vm:

![mvp-diagram](https://i.imgur.com/i5qfOas.png)

My project made use of terraform to configure an automated kubernetes cluster and test vm. I used ansible to configure my vms:

![stretch-digram](https://i.imgur.com/Q5zljVl.png)

## Project Planning

A Jira, agile-scrum board was used to track the progress of the project (pictured below). You can find the link to this board here: https://aatkinson.atlassian.net/jira/software/projects/WOP/boards/2/roadmap

[Epics](https://i.imgur.com/LaPjILK.png)
[Jira Board](https://i.imgur.com/Zmfr0KU.png)

The board has been designed such that elements of the project move from left to right from their point of conception to being finished and fully implemented. Each card has an epic associated with it according to which section of the project it pertains. These epics are:

* *Deploy Terraform*
* *Configure Ansible*
* *Create Jenkins and Create Test Scripts*
* *Configure Kubernetes*
* *Presentation and Documentation*

## Risk Assessment

The risk assessment for this project can be found in the screenshot below:

## Infrastructure 

Terraform was used to automate the building of vpc,subnets etc. in the AWS console and allow me to rebuild my infrastructure much faster. 

![terraform apply](https://i.imgur.com/nsKKrR1.png)

I used ansible to configure the vms and run install scripts. 

Unfortunately, the project wasn't entirely automated and manual configuration had to be done after building the infrastructure:

* SSH into the Jenkins VM as ubuntu
* Add jenkins to sudoers with ALL=(ALL:ALL) NOPASSWD:ALL and to the docker group sudo usermod -aG docker jenkins
* Switch to jenkins user
* Authenticate with aws cli and connect to the cluster
* Retrieve the initial admin password with sudo cat /var/lib/jenkins/secrets/initialAdminPassword
* Generate a public key in the jenkins user and add it to the 'authorized_keys' in the testvm
* Configure new variables e.g. IP, URI
* Go to {jenkins-ip}:8080 and install jenkins plugins
* Build jenkins pipeline on master branch and create a webhook in github
* Before building pipeline, update config file and run ansible playbook
* Run build to create application

## Testing

The app is tested on the jenkins pipeline with pytest. Jenkins goes into the testvm and builds the images/databases. See below for test coverage on the frontend and backend:

![testing coverage](https://i.imgur.com/EwHLXDP.png)

### Jenkins webhooks

My jenkins pipeline uses a webhook to create a new build which tests the frontend and backend before pushing the images to dockerhub and applying the changes with kubernetes. This means the application is always updated to the recent code. I access the application with the load balancer endpoint:

![jenkins output](https://i.imgur.com/oOrvFAT.png)

Browser output of application:

![browser](https://i.imgur.com/MJmw6LH.png)

GitHub webhook:

![webhook](https://i.imgur.com/3IgbS78.png)

## Security

I used .gitignore to stop my credentials and private information from being pushed to github. This allowed me to automate signing into docker hub:
[docker login](https://i.imgur.com/bakYiCu.png)
It also allowed me to refer to database URIs and transfer secret keys for security whilst not revealing the variables and jeopardising the whole project:
[URI credentials](https://i.imgur.com/CkhCkCQ.png)

My ansible used an inventory which linked to a config file (.ssh/config). This allowed me to run ansible without having to push the IP addresses of the vms.

### Future Improvements

There are a number of improvements I would like to implement:

* Eliminate manual tasks seen above such as configuring jenkins as a sudoer for example.
* Create more thorough testing for the application instead of just Unit tests.
* Store more variables in jenkins credentials as it's more secure.
* Run a more complex application so that the project can be demonstrated for a viable product.

## Authors
Atkinson Albert

## Acknowledgements
Benson Luke, Trainer
