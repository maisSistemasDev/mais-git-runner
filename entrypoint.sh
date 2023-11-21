#!/bin/bash

# Usa as variáveis de ambiente definidas no Dockerfile ou passadas no momento da execução
./config.sh --url $REPO_URL --token $RUNNER_TOKEN --name $RUNNER_NAME

# Executa o runner
./run.sh