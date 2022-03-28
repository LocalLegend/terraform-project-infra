LocalLegend project on terraform architecture

### project manager
Stack for resources locallegend apps
Stack providers:
* github
* aws
* google
### gke-cluster
Automatic creation of a Google cluster with an ingress route

How to use:
1. Create google project and set project_id in gke-cluster/main.tf and Set main.tf region and zone
2. Create service role in IAM and added file gke-cluster/gcp_creds.json and gke-app/gcp_creds.json
3. cd gke-cluster and terraform apply

### gke-app
Automatic deploy helm applications

File .auto.tfvars required envs
```env
aws_region
dynanodb_table_name_runners
aws_access_key
aws_secret_key
mongodb_username
mongodb_password
postgres_db
postgres_user
postgres_password
keycloak_user
keycloak_password
rails_master_key
npm_token
```

Require! file gcp_creds.json

How to use:
1. Download k8s cluster access to  ~/.kube/config 
```bash
gcloud container clusters get-credentials locallegend-cluster --zone asia-northeast1-a
```
2. Get ingress route ip
```bash
kubectl get svc -n traefik
```
3. Set ingress route ip for custom domains
4. cd gke-app and terraform apply












