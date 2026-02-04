resource "helm_release" "eks_helm_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace = "kube-system"

# timteout de 10 minutos para os nós ficarem prontos
  timeout = 600

# aguarda os pods ficarem prontos para considerar sucesso
  wait = true

  cleanup_on_fail = true
  force_update    = true
  
  #------- O Account Service precisa ser criado antes do helm controller
  depends_on = [
    kubernetes_service_account.eks_controller_service_account
  ]

   set = [
    {
      name  = "clusterName"
      value = var.eks_name
    },
    {
      name  = "serviceAccount.create"
      value = "false"
    },
    {
      name  = "serviceAccount.name"
      value = "aws-load-balancer-controller"
    },
    {
      name  = "region"
      value = data.aws_region.current.name
    },
    {
      name  = "vpcId"
      value = var.vpc_id
    }
  ]
}