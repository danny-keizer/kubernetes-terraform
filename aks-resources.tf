resource "kubernetes_namespace" "namespace" {
  depends_on   = [local_file.kubeconfig]
  metadata {
    name = var.nsName
  }
}

resource "kubernetes_deployment" "microservice" {
  depends_on   = [kubernetes_namespace.namespace]
  metadata {
    name = var.appName
    namespace = var.nsName
    labels = {
      app = var.appName
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = var.appName
      }
    }

    template {
      metadata {
        labels = {
          app = var.appName
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "${var.appName}-instance"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "foobar"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "loadbalancer" {
  metadata {
    name = "${var.appName}-loadbalancer"
    namespace = var.nsName
  }
  spec {
    selector = {
      app = var.appName
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
