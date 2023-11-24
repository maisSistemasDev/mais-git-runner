#!/bin/bash
echo "Removendo ultimo token"
./config.sh remove

# Usa as variáveis de ambiente definidas no Dockerfile ou passadas no momento da execução
./config.sh --url $REPO_URL --token $RUNNER_TOKEN --runner_name $RUNNER_NAME

echo $REPO_URL
echo $RUNNER_TOKEN
echo $RUNNER_NAME
# Executa o runner
./run.sh