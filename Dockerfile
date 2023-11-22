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

# Adiciona o usuário 'runner' ao grupo 'sudo' e configura o sudoers
RUN usermod -aG sudo runner && \
    echo "runner ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/runner

# Troca para o usuário 'runner'
USER runner

# Define o diretório de trabalho
WORKDIR /home/runner

# Baixa o script de instalação do GitHub Actions runner e o instala
RUN curl -o actions-runner-linux-x64-2.277.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.277.1/actions-runner-linux-x64-2.277.1.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.277.1.tar.gz && \
    rm actions-runner-linux-x64-2.277.1.tar.gz

# Instala as dependências do .NET Core
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 3.0 && \
    ln -s /home/runner/.dotnet/dotnet /usr/local/bin

# Copia o script de entrada
COPY entrypoint.sh .

# Dá permissão de execução para o script de entrada como root
USER root
RUN chmod +x entrypoint.sh
USER runner

# Define o script de entrada como o ponto de entrada do container
ENTRYPOINT ["./entrypoint.sh"]