<img width="1440" height="2352" alt="image" src="https://github.com/user-attachments/assets/73d92834-4af2-4940-ac51-8ce0b5937c0a" />

# DEVOPS-STACK

![CI - GitHub Actions](https://img.shields.io/badge/GitHub_Actions-passing-3fb950?style=flat-square&logo=githubactions&logoColor=white)
![CI - GitLab](https://img.shields.io/badge/GitLab_CI-passing-8957e5?style=flat-square&logo=gitlab&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-ready-1d6fa5?style=flat-square&logo=docker&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-WSL2_Ubuntu-orange?style=flat-square&logo=ubuntu&logoColor=white)

A hands-on DevOps project built during an internship to practice real-world workflows — containerization, CI/CD pipelines, infrastructure automation, and security. The project is structured as a multi-tool DevOps stack and deployed using Docker + Nginx, with pipelines running on both **GitHub Actions** and **GitLab CI**.

---

## 📸 Live Output

| Docker Container Running | App Served at localhost:8080 |
|---|---|
| `devops-nginx` image · port 8080→80 | "Hello from DevOps Project 🚀" |
<img width="1920" height="1020" alt="2026-04-12 (19)" src="https://github.com/user-attachments/assets/ebe50071-6bab-42d2-bc10-6c79523439e7" />

> Nginx is serving a static page from inside a Docker container on WSL2 Ubuntu.

---

## ✅ What's Implemented

### 🐳 Docker + Nginx
- Built a custom Docker image using `nginx:alpine` as the base
- Copied `app/index.html` and `nginx/default.conf` into the image
- Exposed port 80, mapped to host port 8080
- Debugged and fixed a **502 Bad Gateway** error (nginx was proxying to a non-existent upstream on port 3000)
- Fixed a **bash entrypoint syntax error** (`unexpected token 'newline'`)
- Successfully ran container: `docker run -d -p 8080:80 devops-nginx`
  <img width="1920" height="1020" alt="2026-04-12 (22)" src="https://github.com/user-attachments/assets/6534868e-8d56-433d-af31-b172660c9df6" />

### ⚙️ GitLab CI Pipeline
- Created `.gitlab-ci.yml` with a `build` stage and `build-job`
- First run **failed**: `docker: command not found` on GitLab shared runners
  <img width="1920" height="1020" alt="2026-04-12 (27)" src="https://github.com/user-attachments/assets/4f4bc54e-14f2-423a-9c87-9cdb23aa5962" />

  <img width="1920" height="1020" alt="2026-04-12 (43)" src="https://github.com/user-attachments/assets/fadf1c8f-e4fa-46f2-876f-01f52710fffc" />

- Fixed by removing Docker dependency from the pipeline job
- Second run **passed** (Pipeline #2447320552, 30s) — verified project files, echoed build messages
  <img width="1920" height="1020" alt="2026-04-12 (28)" src="https://github.com/user-attachments/assets/d3f24f88-d387-482a-a0b3-1f38c5a03640" />

  <img width="1920" height="1020" alt="2026-04-13 (2)" src="https://github.com/user-attachments/assets/6e11283d-970c-4c91-ac96-36a3f4f0c3f7" />
- Repository: `Rengu / devops-stack` on GitLab
  <img width="1920" height="1020" alt="2026-04-12 (26)" src="https://github.com/user-attachments/assets/b101d8b4-06c9-494b-ac5a-061b7ef11c34" />


### 🐙 GitHub Actions
- Added `bash-check.yml` workflow with a `test-bash` job
  <img width="1920" height="1020" alt="2026-04-18 (9)" src="https://github.com/user-attachments/assets/8336a761-242e-4b42-baf3-8d338c0ec30a" />

  <img width="1920" height="1020" alt="2026-04-18 (13)" src="https://github.com/user-attachments/assets/14514962-2769-41c0-968c-65bcb3cbcdd8" />


- Triggered on every `push` to `main`
- Workflow **passed** on first run (9s total, 4s job time)
- Repository: `rey26341-sudo / devops-stack` on GitHub

### 🔀 Dual Remote Git Setup
- Configured two remotes: `origin` (GitLab) and `github` (GitHub)
- Push to both simultaneously: `git push && git push github main`

  <img width="1920" height="1020" alt="2026-04-12" src="https://github.com/user-attachments/assets/1fb9271c-8a0c-42ea-8c02-68f2c47d3735" />


---

## 🗂️ Project Structure

```
devops-stack/
├── app/                  # Static web app (index.html)
├── nginx/                # Nginx config (default.conf)
├── dockerfile            # Docker image definition
├── ansible/              # Ansible playbooks (planned)
├── terraform/            # Terraform IaC scripts (planned)
├── jenkins/              # Jenkins pipeline config (planned)
├── scripts/              # Bash utility scripts
├── security/             # Security patch check scripts
├── screenshots/          # Proof-of-work screenshots
└── README.md
```

---

## 🐛 Real Debugging Done

| Problem | Fix |
|---|---|
| Nginx 502 Bad Gateway | Removed broken upstream proxy config |
| GitLab CI docker not found | Removed Docker dependency from shared runner job |
| GitHub auth failure | Switched from password to Personal Access Token |
| Bash entrypoint syntax error | Fixed newline formatting in entrypoint script |

## 📋 What's Next
- [ ] Ansible playbook for server config automation
- [ ] Terraform for GCP VM provisioning
- [ ] Jenkins self-hosted pipeline
- [ ] Kubernetes deployment with Helm

## 🛠️ Tools Used

| Tool | Purpose | Status |
|---|---|---|
| Docker | Containerization | ✅ Implemented |
| Nginx | Reverse proxy / static server | ✅ Implemented |
| GitHub Actions | CI pipeline | ✅ Implemented |
| GitLab CI | CI pipeline | ✅ Implemented |
| Bash | Scripting & automation | ✅ Implemented |
| Ansible | Server configuration automation | 🔧 In Progress |
| Terraform | Infrastructure as Code | 🔧 In Progress |
| Jenkins | CI/CD pipeline (self-hosted) | 🔧 In Progress |
| GCP | Cloud VM provisioning | 📋 Planned |

---

## 🚀 Getting Started

### Prerequisites
- Docker installed (or WSL2 + Docker Desktop on Windows)
- Git

### Run Locally

```bash
# Clone the repo
git clone https://github.com/rey26341-sudo/devops-stack.git
cd devops-stack

# Build the Docker image
docker build -t devops-nginx .

# Run the container
docker run -d -p 8080:80 devops-nginx

# Open in browser
# → http://localhost:8080
```

### Verify it's running

```bash
docker ps
# You should see devops-nginx mapped to 0.0.0.0:8080->80/tcp
```

---

## 🔄 CI/CD Pipeline Flow

```
Developer pushes code to GitHub / GitLab
         │
         ▼
┌─────────────────────────────────┐
│   GitHub Actions (bash-check)   │  ← triggers on push to main
│   • Runs test-bash job (4s)     │
│   • Status: ✅ PASSING          │
└─────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│   GitLab CI (.gitlab-ci.yml)    │  ← triggers on push to main
│   • Runs build-job (30s)        │
│   • Verifies project structure  │
│   • Status: ✅ PASSING          │
└─────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│   Docker image built locally    │  ← manual step (local WSL2)
│   • nginx:alpine base           │
│   • Served at localhost:8080    │
└─────────────────────────────────┘
---
---

## 👤 Author

**Iswaryak / Rengu** — DevOps Intern  
📍 Tiruchirappalli, Tamil Nadu  
🔗 [GitLab](https://gitlab.com/rengu26341) · [GitHub](https://github.com/rey26341-sudo)

