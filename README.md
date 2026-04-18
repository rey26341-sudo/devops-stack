# DevOps Stack Project

## Features
- Terraform-based VM provisioning (GCP-style)
- Ansible automation for server setup
- Nginx reverse proxy configuration
- Database backup script
- Jenkins CI/CD pipeline
- Basic security patch check

## Tools Used
Terraform | Ansible | Nginx | Jenkins | Bash | GCP (concept)

## Outcome
Demonstrates real-world DevOps workflow including:
IaC + Automation + CI/CD + Security
## Live Output

### Application Running
![App](screenshots/app-output.png)

### Docker Container
![Docker](screenshots/docker-running.png)
## CI/CD Pipeline Flow

```text
1. Developer pushes code to GitHub

2. GitHub webhook triggers Jenkins pipeline

3. Jenkins:
   - Pulls latest code
   - Builds Docker image
   - Runs tests
   - Tags image

4. Jenkins deploys image:
   - Docker server (docker compose) OR
   - Kubernetes (kubectl/Helm)

5. Nginx exposes application

6. Monitoring verifies health
```
