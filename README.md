Prerequisites
Tools Required:

Terraform (>= 1.0)
kubectl (>= 1.20)
Docker (>= 20.10)
Helm (>= 3.5, for Prometheus setup)

###  SetUp InfraStructure ### 
Navigate to TerraformScripts dir

# Authenticate azure Cloud using 

az login -u username -p password -t tenant_id   or   az login -username managed_identiy_client_id

# 1. terraform validate the script check for any errors in the syntax
  terraform validate

# 2. initiliaze terraform backend with required providers will setup
  terraform init -backend-config backend.tfvars

# 3. terraform plan the script check everthing is able to create with the required authentication
  terraform plan --var-file variables.tfvars

# 4. Finally setup infra using apply, pass yes for the user prompt to accept and create listed resources
  terraform apply --var-file variables.tfvars


### Docker BUild and Push  ###

Navigate to App Folder, perfom Docker Build and Push

# 1. Login to the Docker ACR using credentials
  docker login -u username -p password registryurl
  here username can be admin user or any Azure APP Registration with acr pull permissions can be used

# 2. build the require ddocker image
  docker build -t ACRURL/reponame:tag .

# 3. push the image to registry
  docker push -t ACRURL/reponame:tag


### Deploy to Kuberneres Cluster ###

# Navigate to KubernetesYamls, apply deployment and service yamls files
  az login -u username -p password -t tenant_id    or   az login -username managed_identiy_client_id

 az account set --subscription azure_subscription_id
 az aks get-credentials --resource-group resource-group_name --name clisternme --overwrite-existing --admin

 kubectl get apply -f deployment.yaml
 kubectl get apply -f service.yaml



### deploy montoring  setup in cluster ####

# Navigate to Montering, setup prometheus, grafana, loki and prmomtail for application logs and metrics

helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm upgrade --install loki-stack grafana/loki-stack -n logging --values grafana-prometheus-values.yaml
