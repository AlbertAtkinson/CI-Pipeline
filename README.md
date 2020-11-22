# DevOps CI-Pipeline Practical Project

This application is a simple [Flask application](https://flask.palletsprojects.com/en/1.1.x/quickstart/#a-minimal-application), ready to be deployed, for your SFIA2 project.

The following information should be everything you need to complete the project.

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

### The application works by:
1. The frontend service making a GET request to the backend service. 
2. The backend service using a database connection to query the database and return a result.
3. The frontend service serving up a simple HTML (`index.html`) to display the result.

## Project Planning

A Jira, agile-scrum board was used to track the progress of the project (pictured below). You can find the link to this board here: https://aatkinson.atlassian.net/jira/software/projects/WOP/boards/2/roadmap

![Jira Roadmap](https://i.imgur.com/VXdmhKq.png)
![Jira Board](https://i.imgur.com/Z97X0EL.png)

The board has been designed such that elements of the project move from left to right from their point of conception to being finished and fully implemented. Each card has an epic associated with it according to which section of the project it pertains. These epics are:

## Testing

The app is tested on the jenkins pipeline with pytest. Jenkins goes into the testvm and builds the images/databases. See below for test coverage on the frontend and backend:
![testing coverage](https://i.imgur.com/EwHLXDP.png)
![Jira Roadmap](https://i.imgur.com/Zmfr0KU.png)

![terraform apply](https://i.imgur.com/nsKKrR1.png)

## Authors
Atkinson Albert

## Acknowledgements
Benson Luke, Trainer Aguila Carlos
