terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name  = "my-nginx"
  image = docker_image.nginx_image.name

  ports {
    internal = 80
    external = 8080
  }

volumes {
  host_path      = abspath("${path.module}/html")
  container_path = "/usr/share/nginx/html"
}

}

output "container_id" {
  value = docker_container.nginx_container.id
}

output "container_name" {
  value = docker_container.nginx_container.name
}

output "nginx_status" {
  value = "http://localhost:8080 is now running!"
}
