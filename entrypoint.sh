#!/bin/bash

# Usa as variáveis de ambiente definidas no Dockerfile ou passadas no momento da execução
./config.sh --url $REPO_URL --token $RUNNER_TOKEN

echo $REPO_URL
echo $RUNNER_TOKEN

# Executa o runner
./run.sh