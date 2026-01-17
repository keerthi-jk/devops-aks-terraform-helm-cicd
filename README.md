# End-to-End DevOps CI/CD on Azure Kubernetes (AKS)

This project demonstrates a complete DevOps workflow: provisioning cloud infrastructure with Terraform, containerizing an application with Docker, deploying to Azure Kubernetes Service (AKS) using Helm, and automating CI/CD with GitHub Actions.

## Key Features 

- Python Flask application with Redis-backed visit counter
- Dockerized application image published to Docker Hub
- Azure Kubernetes Service (AKS) provisioned using Terraform
- Helm chart for deploying Flask and Redis on Kubernetes
- LoadBalancer service exposing the application publicly
- GitHub Actions CI/CD pipeline:
  - Builds and pushes Docker images
  - Deploys to AKS using Helm
- Secure cluster access using kubeconfig stored in GitHub Secrets

## Tech Stack

- Python, Flask, Redis  
- Docker & Docker Hub  
- Kubernetes (Azure AKS)  
- Helm  
- Terraform (AzureRM)  
- GitHub Actions  
- Azure Cloud  

## CI/CD Workflow

On every push to the main branch:

1. GitHub Actions builds a Docker image
2. Pushes the image to Docker Hub
3. Connects to AKS using kubeconfig credentials
4. Deploys the application using Helm rolling updates

## Infrastructure as Code

AKS cluster is provisioned with Terraform:

- Managed Kubernetes cluster
- Node pool configuration
- Azure LoadBalancer integration
- RBAC-enabled access

## Local Development

Run the application locally using Docker Compose:

```bash
docker compose up --build

Cloud Deployment
Provision AKS:terraform apply
Deploy Application
helm upgrade --install webapp ./helm/webapp-python
Destroy infrastructure to stop billing:
terraform destroy



