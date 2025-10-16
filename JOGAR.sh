#!/bin/bash

echo ""
echo "🎰 JACKPOT GAME - VERSÃO WEB 🎰"
echo "==============================="
echo ""

# Verificar se o arquivo index.html existe
if [ ! -f "index.html" ]; then
    echo "❌ Arquivo index.html não encontrado!"
    echo "💡 Certifique-se de estar no diretório correto"
    exit 1
fi

# Verificar se Python está disponível
if command -v python3 &> /dev/null; then
    echo "🚀 Iniciando servidor web..."
    echo "🌐 O jogo vai abrir no navegador"
    echo "🎯 Divirta-se!"
    echo ""
    echo "💡 Pressione Ctrl+C para parar o servidor"
    echo ""
    
    python3 server.py
else
    echo "❌ Python não encontrado!"
    echo ""
    echo "📋 Alternativas:"
    echo "1. Instale Python3"
    echo "2. Abra o arquivo index.html diretamente no navegador"
    echo ""
    read -p "Pressione Enter para sair..."
fi
