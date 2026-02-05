resource "helm_release" "kube_prometheus_stack" {
  name             = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "56.6.2"

  values = [
    file("${path.module}/values.yaml")
  ]

  timeout = 600
  wait    = true
  atomic  = false
  cleanup_on_fail = true
}