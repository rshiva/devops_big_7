# ArgoCD setup 

Prerequisites
- kubectl - install it to work with kubernetes cluster
- eksctl - for create EKS cluster in AWS
- AWS CLI - for working with AWS services

- 
#
- 1 hub cluster where ArgoCD will be installed 
- 2 Spoke cluster where our application is deployed using kubernetes
- 
ArgoCD cluster doesn't allow to add cluster from UI, you have to install CLI

## EKS Setup
```
eksctl create cluster --name hub-cluster --region us-east-2

eksctl create cluster --name spoke-cluster-1 --region us-east-2

eksctl create cluster --name spoke-cluster-2 --region us-east-2
```

## ArgoCD setup
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
### Secure ArgoCD 

argocd login 

kubectl config get-contexts

 argocd cluster add 


 Next

 how to implement  application set in ArgoCD