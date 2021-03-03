set +x
echo "Don't forget to add 127.0.0.1 argocd.local to /etc/hosts"
kubectl create namespace argocd
kubectl apply --validate=true -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply --validate=true -f ingress.yaml
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
