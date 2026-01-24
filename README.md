# End-to-End DevOps CI/CD on Azure Kubernetes (AKS)

This project demonstrates a complete DevOps workflow: provisioning cloud infrastructure with Terraform, containerizing an application with Docker, deploying to Azure Kubernetes Service (AKS) using Helm, and automating CI/CD with GitHub Actions.

## Architecture Flow

Terraform → Provisions AKS cluster  
GitHub Actions → Builds & pushes Docker image  
Helm → Deploys Flask + Redis to AKS  
Helm → Deploys Prometheus + Grafana (observability setup)  
Prometheus → Scrapes cluster & pod metrics  
Grafana → Displays live dashboards  

## Key Features

- Python Flask application with Redis-backed visit counter  
- Container image built and published to Docker Hub via CI pipeline  
- Azure Kubernetes Service (AKS) provisioned using Terraform  
- Helm chart for deploying Flask and Redis on Kubernetes  
- LoadBalancer service exposing the application publicly  
- GitHub Actions CI/CD pipeline:
  - Builds and pushes Docker images  
  - Deploys to AKS using Helm  
- Cluster access configured via kubeconfig stored in GitHub Secrets


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
3. Authenticates to AKS and deploys the application using Helm-based rolling updates


## Infrastructure as Code

AKS cluster is provisioned with Terraform:

- Managed Kubernetes cluster  
- Node pool configuration  
- Azure LoadBalancer integration  
- RBAC-enabled access  

## Local Development

Run the application locally using Docker Compose:

    docker compose up --build

## Cloud Deployment
    
    # Provision AKS
    terraform init
    terraform apply

    # Deploy application
    helm upgrade --install webapp ./helm/webapp-python

    # Destroy infrastructure
    terraform destroy

## Observability

The project includes a full monitoring stack deployed inside AKS using Helm:

- Monitoring stack installed using the kube-prometheus-stack Helm chart  
- Prometheus for metrics collection  
- Grafana for visualization  
- Kubernetes pod and node-level dashboards  

Grafana is accessed using kubectl port-forward, and live application pod metrics are visualized through prebuilt dashboards.

## What I Learned

- Provisioned Azure AKS infrastructure using Terraform with remote state management  
- Built CI/CD pipelines using GitHub Actions for containerized applications  
- Deployed microservices to Kubernetes using Helm  
- Implemented Prometheus and Grafana for cluster and application observability  
- Verified live pod-level metrics through Grafana dashboards
