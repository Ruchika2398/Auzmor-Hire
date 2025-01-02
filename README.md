# Auzmor-Hire
Deployment of a web application in a cloud-based Kubernetes solution

Create IAC Template using terraform for provisiong infrastructure on AWS for web application  <br>
USE IAC.tf File <br>
Then Configure Kubernetes.yml file along with service.yaml  <br>
For monitoring soution configuration  -- use prometheus.yaml file <br>
Dockerfile is used to containerize the web application where base image is from node.js which is exposed to port 80 <br>
  For Deployment -Provision Infrastructure - -> Install terraform and apply the Terraform template to provision a Kubernetes cluster using such commands :- <br>
     terraform init
     terraform apply 
  Deploy the Web application -- Use kubectl for configuration & then apply the Kubernetes deployment and service manifests: <br>
     kubectl apply -f deployment.yaml -f service.yaml
  To set up monitoring - Create monitoring namespace <br>
     kubectl create namespace monitoring
  Then apply it using command :- <br>
     kubectl apply -f prometheus.yaml
  Now to access the web application use external Ip of loadbalancer service <br>
     kubectl get service web-app-service
  And to access monitoring use Port Forward : <br>
     kubectl port-forward -n monitoring deployment/prometheus 9090:9090
  To access application - Open your browser and navigate to http://localhost:9090. <br>
