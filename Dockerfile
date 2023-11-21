# Use a imagem base do Ubuntu
FROM ubuntu:20.04

# Evita prompts interativos durante a construção da imagem
ARG DEBIAN_FRONTEND=noninteractive

# Instala as dependências necessárias
RUN apt-get update && \
    apt-get install -y \
    curl \
    sudo \
    git \
    jq \
    tar \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Cria um usuário para o runner (opcional)
RUN useradd -m runner

# Troca para o usuário 'runner'
USER runner

# Define o diretório de trabalho
WORKDIR /home/runner

# Baixa o script de instalação do GitHub Actions runner e o instala
RUN curl -o actions-runner-linux-x64-2.277.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.277.1/actions-runner-linux-x64-2.277.1.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.277.1.tar.gz && \
    rm actions-runner-linux-x64-2.277.1.tar.gz

# Copia o script de entrada
COPY entrypoint.sh .


# Define o script de entrada como o ponto de entrada do container
ENTRYPOINT ["./entrypoint.sh"]