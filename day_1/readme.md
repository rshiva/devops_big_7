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
* Tech Stack: Gunicorn, Flask (Backend), DynamoDB (Database).

Encode the AWS ACCESS ID & ACCESS KEY
```
echo -n "your-access-key-id" | base64
echo -n "your-secret-access-key" | base64
```

```
cd kubernetes 
kubectl apply -f namespace.yaml & k apply -f .
```

* Tasks:
    * Deploy a Flask API with environment variables stored in ConfigMaps and Secrets.
    * Expose the services using ClusterIP and Ingress.
    ```
    minikube addons enable ingress
    minikube tunnel #keep this running
    kubectl get services -n flask-app

    ```


    ```
    curl --location 'EXTERNAL-IP/api/user' \
    --header 'Content-Type: application/json' \
    --data-raw '{"email": "sample@gmail.com",
     "username": "sample"}'

     curl --location --request GET 'http://127.0.0.1/api/user' \
    ```
