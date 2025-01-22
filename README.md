# Infrastructure Deployment and Application Setup Guide

## Prerequisites

### Tools Required:
- **Terraform** (>= 1.0)
- **kubectl** (>= 1.20)
- **Docker** (>= 20.10)
- **Helm** (>= 3.5, for Prometheus setup)

---

## Setup Infrastructure

1. **Navigate to the TerraformScripts directory**:
   ```bash
   cd TerraformScripts
   ```

2. **Authenticate with Azure Cloud**:
   ```bash
   az login -u <username> -p <password> -t <tenant_id>
   ```
   Alternatively, for Managed Identity:
   ```bash
   az login --identity --username <managed_identity_client_id>
   ```

3. **Validate the Terraform script**:
   ```bash
   terraform validate
   ```

4. **Initialize Terraform backend with required providers**:
   ```bash
   terraform init -backend-config=backend.tfvars
   ```

5. **Check the Terraform plan**:
   ```bash
   terraform plan --var-file=variables.tfvars
   ```

6. **Apply Terraform to set up the infrastructure**:
   ```bash
   terraform apply --var-file=variables.tfvars
   ```
   Pass `yes` to confirm and create the listed resources.

---

## Docker Build and Push

1. **Navigate to the App folder**:
   ```bash
   cd App
   ```

2. **Login to the Docker ACR**:
   ```bash
   docker login -u <username> -p <password> <registry_url>
   ```
   - `username`: Admin user or Azure App Registration with ACR pull permissions.

3. **Build the Docker image**:
   ```bash
   docker build -t <ACR_URL>/<repository_name>:<tag> .
   ```

4. **Push the Docker image to the registry**:
   ```bash
   docker push <ACR_URL>/<repository_name>:<tag>
   ```

---

## Deploy to Kubernetes Cluster

1. **Navigate to Kubernetes YAMLs directory**:
   ```bash
   cd KubernetesYamls
   ```

2. **Authenticate with Azure Cloud**:
   ```bash
   az login -u <username> -p <password> -t <tenant_id>
   ```
   Alternatively, for Managed Identity:
   ```bash
   az login --identity --username <managed_identity_client_id>
   ```

3. **Set the Azure subscription**:
   ```bash
   az account set --subscription <azure_subscription_id>
   ```

4. **Get Kubernetes cluster credentials**:
   ```bash
   az aks get-credentials --resource-group <resource_group_name> --name <cluster_name> --overwrite-existing --admin
   ```

5. **Deploy the application**:
   ```bash
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml
   ```

---

## Deploy Monitoring Setup in Cluster

1. **Navigate to the Monitoring directory**:
   ```bash
   cd Monitoring
   ```

2. **Set up Prometheus, Grafana, Loki, and Promtail for logs and metrics**:
   - Apply Grafana configuration:
     ```bash
     kubectl apply -f 'grafana-*.yaml' -l app=monitoring
     ```

   - Add Grafana Helm repository:
     ```bash
     helm repo add grafana https://grafana.github.io/helm-charts
     helm repo update
     ```

   - Install or upgrade Loki stack:
     ```bash
     helm upgrade --install loki-stack grafana/loki-stack -n logging --values grafana-prometheus-values.yaml
     ```

