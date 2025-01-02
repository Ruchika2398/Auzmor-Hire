# Auzmor-Hire
Deployment of a web application in a cloud-based Kubernetes solution

Create IAC Template using terraform for provisiong infrastructure on AWS for web application  <br>
USE IAC.tf File
Then Configure Kubernetes.yml file along with service.yaml  
For monitoring soution configuration  -- use prometheus.yaml file
Dockerfile is used to containerize the web application where base image is from node.js which is exposed to port 80
  For Deployment -Provision Infrastructure - -> Install terraform and apply the Terraform template to provision a Kubernetes cluster using such commands :-
     terraform init
     terraform apply 
  Deploy the Web application -- Use kubectl for configuration & then apply the Kubernetes deployment and service manifests:
     kubectl apply -f deployment.yaml -f service.yaml
  To set up monitoring - Create monitoring namespace
     kubectl create namespace monitoring
  Then apply it using command :-
     kubectl apply -f prometheus.yaml
  Now to access the web application use external Ip of loadbalancer service
     kubectl get service web-app-service
  And to access monitoring use Port Forward :
     kubectl port-forward -n monitoring deployment/prometheus 9090:9090
  To access application - Open your browser and navigate to http://localhost:9090.
