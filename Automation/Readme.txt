This is the same project that we discussed in the second round of my interview at HRS. Embarking on a DevSecOps journey with AWS, I've successfully implemented a robust pipeline to deploy a Netflix Clone on the cloud. I have not uploaded dependencies of other files so that the commit remains clean and easy for the reader.

Here's a step-by-step breakdown of the process:

Phase 1: Initial Setup and Deployment

1. Launched an EC2 instance on AWS with Ubuntu 22.04.
2. Cloned the Netflix Clone application's code onto the EC2 instance.
3. Installed Docker, built a Docker image, and ran the application using containers.
4. Secured the application by obtaining a TMDB API key.

Phase 2: Security

1. Installed SonarQube and Trivy for code quality and vulnerability scanning.
2. Integrated SonarQube into the CI/CD pipeline.

Phase 3: CI/CD Setup with Jenkins

1. Installed Jenkins for automation.
2. Configured necessary plugins, tools (Java, Node.js), and SonarQube integration.
3. Set up Jenkins pipeline for continuous integration and deployment.
4. Ensured secure Docker handling within Jenkins.

Phase 4: Monitoring with Prometheus and Grafana

1. Installed Prometheus and Node Exporter for monitoring.
2. Configured Prometheus to scrape metrics from Node Exporter and Jenkins.
3. Installed Grafana for visualization and created a dashboard to monitor metrics.

Phase 5: Notification

Implemented email notifications in Jenkins for effective communication during the CI/CD pipeline.

Phase 6: Kubernetes

1. Created a Kubernetes cluster with node groups.
2. Monitored Kubernetes with Prometheus.
3. Installed Node Exporter using Helm.

Phase 7: Application Deployment with ArgoCD

1. Installed ArgoCD for GitOps-based application deployment.
2. Set up the GitHub repository as the source for the application.
3. Created an ArgoCD application and accessed the deployed app.

Phase 8: Cleanup

Ensured AWS resources are managed efficiently by terminating unnecessary EC2 instances.
