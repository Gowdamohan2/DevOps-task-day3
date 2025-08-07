# 🐳 Docker Container Provisioning with Terraform – Task 3

This project demonstrates Infrastructure as Code (IaC) using **Terraform** to provision and manage a **local Docker container running NGINX**.

---

## 🧰 Tools & Technologies

- **Terraform**
- **Docker**
- **NGINX**

---

## 🎯 Objective

Provision a local NGINX container using Terraform with proper port binding, volume mapping, and health verification.

---

## 🛠️ What I Did

- Initialized a Terraform project using the Docker provider.
- Wrote `main.tf` to:
  - Pull the latest NGINX Docker image.
  - Run an NGINX container mapped to port `8080`.
  - Mount a host HTML directory (`./html`) to NGINX's default `/usr/share/nginx/html`.
- Used Terraform commands:
  - `terraform init` to initialize the working directory.
  - `terraform plan` to preview changes.
  - `terraform apply` to provision the container.
  - `terraform destroy` to tear down infrastructure.
  - `terraform state` to inspect state management.
- Tested container accessibility via `http://localhost:8080`.

---

## ⚙️ Improvements Made

-  **Volume Mount Fix**: Replaced relative path (`"./html"`) with `abspath("${path.module}/html")` to ensure Terraform recognizes it as an absolute path across operating systems (Windows, macOS, Linux).
-  **Container Health Check**: Verified NGINX is serving correctly and returns expected HTTP 200 or 403 responses, confirming proper HTML binding.

---

##  Output

- Hands-on understanding of Terraform's Docker provider
- Real-time provisioning and debugging using Docker
- How to map local resources into containers
- Practical issues with cross-platform path handling and how to resolve them
