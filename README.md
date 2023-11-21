# mais-git-runner

## Overview

The "mais-git-runner" is a Docker container solution designed to host and run a self-hosted GitHub Actions runner. This enables you to run your GitHub Actions workflows on your own infrastructure, providing you with more control and customization over the execution environment.

## Features

- **Self-hosted Runner**: Run your GitHub Actions workflows on your own servers.
- **Customizable Environment**: Configure the runner environment using environment variables.
- **Docker Support**: The runner has the capability to run Docker-based actions.

## Prerequisites

- Docker installed on your host machine.
- A GitHub repository or organization where you have administrative access to add a runner.
- A GitHub Personal Access Token (PAT) with the appropriate scopes to register the runner.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/mais-git-runner.git
   cd mais-git-runner
Build the Docker image:

docker build -t mais-git-runner .


docker-compose up -d
Customization
You can customize the runner by changing the environment variables in the .env file:

RUNNER_NAME: The name of the runner as it will appear on GitHub.
REPO_URL: The URL of the GitHub repository or organization.
RUNNER_TOKEN: The token used to register the runner with GitHub.
RUNNER_WORKDIR: The working directory for the runner.