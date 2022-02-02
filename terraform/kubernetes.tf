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

resource "kubernetes_pod" "signed" {
  metadata {
    name = "signed"
  }

  spec {
    container {
      image = "smazzone/image-demo:signed"
      name  = "signed"

      port {
        container_port = 8080
      }
    }
  }
}

resource "kubernetes_pod" "not-signed" {
  metadata {
    name = "not-signed"
    namespace = "validateme"
  }

  spec {
    container {
      image = "smazzone/image-demo:not-signed"
      name  = "not-signed"

      port {
        container_port = 8080
      }
    }
  }
}


/* resource "kubernetes_pod" "signed-validated" {
  metadata {
    name = "signed-validated"
    namespace = "validateme"
  }

  spec {
    container {
      image = "smazzone/image-demo:signed"
      name  = "signed"

      port {
        container_port = 8080
      }
    }
  }
} */