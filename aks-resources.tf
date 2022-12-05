resource "kubernetes_namespace" "namespace" {
  depends_on   = [local_file.kubeconfig]
  metadata {
    name = var.nsName
  }
}

