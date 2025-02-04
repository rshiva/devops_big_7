Day 1: Deploy a Multi-Tier Web Application

* Build and Run the Docker
```
docker build -t rshiva86/flask-dynamodb:1.0 .

docker run -p 6000:6000 \
-e AWS_REGION=us-east-1 \
-e AWS_ACCESS_KEY_ID=$(aws secretsmanager get-secret-value --secret-id my-dynamodb-secrets --query SecretString --output text  | jq -r .AWS_ACCESS_KEY_ID) \
-e AWS_SECRET_ACCESS_KEY=$(aws secretsmanager get-secret-value --secret-id my-dynamodb-secrets --query SecretString --output text | jq -r .AWS_SECRET_ACCESS_KEY) \
rshiva86/flask-dynamodb:1.0

```
- AWS Key and Secrets are stored aws secret manager
- Create a dynamodb table with name users
* Use Terraform to provide resources
* Concepts Covered: Deployments, Services, Ingress, ConfigMaps, Secrets.
* Tech Stack: Nginx (Frontend), Flask (Backend), PostgreSQL (Database).
* Tasks:
    * Deploy a frontend using Nginx.
    * Deploy a Flask API with environment variables stored in ConfigMaps and Secrets.
    * Deploy PostgreSQL with Persistent Volume.
    * Expose the services using ClusterIP and Ingress.