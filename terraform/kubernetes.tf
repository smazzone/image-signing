terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

variable "host" {
  type = string
}

variable "client_certificate" {
  type = string
}

variable "client_key" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}

provider "kubernetes" {
  host = var.host

  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}


resource "kubernetes_pod" "test" {
  metadata {
    name = "test"
  }

  spec {
    container {
      image = "smazzone/image-demo:test"
      name  = "test"

      port {
        container_port = 8080
      }
    }
  }
}

resource "kubernetes_pod" "hello-world" {
  metadata {
    name = "hello-world"
  }

  spec {
    container {
      image = "docker.io/hello-world"
      name  = "hello-world"

      port {
        container_port = 8080
      }
    }
  }
}

# resource "kubernetes_namespace" "validateme" {
#   metadata {
#     annotations = {
#       name = "validateme namespace"
#     }

#     labels = {
#       mylabel = "validateme namespace"
#     }

#     name = "validateme"
#   }
# }

# resource "kubernetes_pod" "signed" {
#   metadata {
#     name = "signed"
#   }

#   spec {
#     container {
#       image = "smazzone/image-demo:signed"
#       name  = "signed"

#       port {
#         container_port = 8080
#       }
#     }
#   }
# }

# resource "kubernetes_pod" "not-signed" {
#   metadata {
#     name = "not-signed"
#     namespace = "validateme"
#   }

#   spec {
#     container {
#       image = "smazzone/image-demo:not-signed"
#       name  = "not-signed"

#       port {
#         container_port = 8080
#       }
#     }
#   }
# }


