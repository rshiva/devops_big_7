# Deploying flask app in kubernetes
- Blue/Green deployment
- Canary deployment
- Horizontal Pod Autoscaling
- Role, RoleBinding and Service Account
- Network Policy

## Monitoring using prometheus
- ~~deployed prometheus in separate namespace~~
- installing using helm
- CRD(custom resource definition) method
  ```
    helm upgrade --install prometheus prometheus-community/kube-prometheus-stack -n monitoring --force


    kubectl port-forward -n monitoring service/prometheus-kube-prometheus-prometheus 9090

    kubectl port-forward -n monitoring  POD_NAME 3000
  ```



## Grafana
- installed using helm
  ```
    helm repo add grafana https://grafana.github.io/helm-charts
    helm reop update
    helm install grafana grafana/grafana -n monitoring

    kubectl port-forward service/grafana -n monitoring 3000:3000 
  ```