#!/bin/bash

# Define o nome da pasta principal e da subpasta
PASTA_PRINCIPAL="Paulo Lennon"
PASTA_RESULTADO="resultado"
ARQUIVO_URL="https://vanilton.net/v1/download/zip.zip"
ARQUIVO_ZIP="zip.zip"

# Cria a pasta principal
mkdir -p "$PASTA_PRINCIPAL"

# Cria a subpasta "resultado" dentro da pasta principal
mkdir -p "$PASTA_PRINCIPAL/$PASTA_RESULTADO"

# Baixa o arquivo para a pasta principal
wget -q "$ARQUIVO_URL" -O "$PASTA_PRINCIPAL/$ARQUIVO_ZIP"

# Verifica se o arquivo foi baixado com sucesso
if [ -f "$PASTA_PRINCIPAL/$ARQUIVO_ZIP" ]; then
    # Descompacta o arquivo na raiz da pasta principal
    unzip -q "$PASTA_PRINCIPAL/$ARQUIVO_ZIP" -d "$PASTA_PRINCIPAL"

    # Move os arquivos descompactados para a pasta "resultado"
    mv "$PASTA_PRINCIPAL"/* "$PASTA_PRINCIPAL/$PASTA_RESULTADO" 2>/dev/null

    # Remove o arquivo baixado
    rm "$PASTA_PRINCIPAL/$ARQUIVO_ZIP"

    echo "Script executado com sucesso."
else
    echo "Erro ao baixar o arquivo. Verifique a URL e tente novamente."
fi
