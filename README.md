# Learn GitLab CI/CD by building a complete CICD pipeline for a python demo project | with Docker
# DO ONLY test and build stages! from Crash Course

## Python Flask - Demo Web Application

This is a simple Python Flask web application. The app provides system information and a realtime monitoring screen with dials showing CPU, memory, IO and process information.

The app has been designed with cloud native demos & containers in mind, in order to provide a real working application for deployment, something more than "hello-world" but with the minimum of pre-reqs. It is not intended as a complete example of a fully functioning architecture or complex software design.


## Screenshot

![screen](../images/Screenshot_2568-06-01_at_20.45.04.png)


## Building & Running Locally

### Pre-reqs

- Be using Linux, WSL or MacOS, with bash, make etc
- [Python 3.8+](https://www.python.org/downloads/) - for running locally, linting, running tests etc
- [Docker](https://docs.docker.com/get-docker/) - for running as a container, or image build and push


### Makefile

A standard GNU Make file is provided to help with running and building locally.

```text
help                 💬 This help message
lint                 🔎 Lint & format, will not fix but sets exit code on error
lint-fix             📜 Lint & format, will try to fix errors and modify code
image                🔨 Build container image from Dockerfile
push                 📤 Push container image to registry
run                  🏃 Run the server locally using Python & Flask
deploy               🚀 Deploy to Azure Web App
undeploy             💀 Remove from Azure
test                 🎯 Unit tests for Flask app
test-report          🎯 Unit tests for Flask app (with report output)
test-api             🚦 Run integration API tests, server must be running
clean                🧹 Clean up project
```

Make file variables and default values, pass these in when calling `make`, e.g. `make image IMAGE_REPO=blah/foo`

| Makefile Variable | Default               |
| ----------------- | --------------------- |
| IMAGE_REPO        | bhornpat/demo-app     |
| IMAGE_TAG         | python-app-1.0        |

The app runs under Flask and listens on port 5000 by default, this can be changed with the `PORT` environmental variable.

## Containers

Run in a container with:

```bash
docker pull bhornpat/demo-app:python-app-1.0
docker run -it -p 5000:5000 bhornpat/demo-app:python-app-1.0
```

Should you want to build your own container, use `make image` and the above variables to customise the name & tag.

## GitHub Actions CI/CD

A working set of CI and CD release GitHub Actions workflows are provided `.github/workflows/`, automated builds are run in GitHub hosted runners


