terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "nginx_image" {
  name          = "nginx:latest"
  keep_locally  = false
}

resource "docker_container" "nginx_container" {
  name  = "my-nginx"
  image = docker_image.nginx_image.name

  ports {
    internal = 80
    external = 8080
  }
}
