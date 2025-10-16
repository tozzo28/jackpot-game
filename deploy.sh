#!/bin/bash

echo ""
echo "🚀 DEPLOY DO JACKPOT GAME 🚀"
echo "============================"
echo ""

echo "Escolha uma opção de deploy:"
echo ""
echo "1. 📁 Preparar arquivos para GitHub Pages"
echo "2. 🌐 Deploy no Netlify (via CLI)"
echo "3. 📦 Deploy no Vercel (via CLI)"
echo "4. 🌊 Deploy no Surge.sh (via CLI)"
echo "5. 📋 Mostrar instruções manuais"
echo ""

read -p "Digite o número da opção (1-5): " choice

case $choice in
    1)
        echo ""
        echo "📁 Preparando arquivos para GitHub Pages..."
        echo ""
        
        # Criar pasta para deploy
        mkdir -p deploy
        
        # Copiar arquivos necessários
        cp index.html deploy/
        cp README.md deploy/
        
        # Criar arquivo de configuração para GitHub Pages
        echo "<!-- GitHub Pages -->" > deploy/index.html.tmp
        cat index.html >> deploy/index.html.tmp
        mv deploy/index.html.tmp deploy/index.html
        
        echo "✅ Arquivos preparados em: ./deploy/"
        echo ""
        echo "📋 Próximos passos:"
        echo "1. Crie um repositório no GitHub"
        echo "2. Faça upload da pasta 'deploy'"
        echo "3. Ative GitHub Pages em Settings > Pages"
        echo "4. Acesse: https://seu-usuario.github.io/nome-do-repo"
        echo ""
        ;;
    2)
        echo ""
        echo "🌐 Deploy no Netlify..."
        echo ""
        
        if command -v netlify &> /dev/null; then
            echo "🚀 Fazendo deploy..."
            netlify deploy --prod --dir .
            echo "✅ Deploy concluído!"
        else
            echo "❌ Netlify CLI não encontrado!"
            echo ""
            echo "📋 Para instalar:"
            echo "npm install -g netlify-cli"
            echo ""
            echo "💡 Alternativa: Acesse netlify.com e arraste os arquivos"
        fi
        ;;
    3)
        echo ""
        echo "📦 Deploy no Vercel..."
        echo ""
        
        if command -v vercel &> /dev/null; then
            echo "🚀 Fazendo deploy..."
            vercel --prod
            echo "✅ Deploy concluído!"
        else
            echo "❌ Vercel CLI não encontrado!"
            echo ""
            echo "📋 Para instalar:"
            echo "npm install -g vercel"
            echo ""
            echo "💡 Alternativa: Acesse vercel.com e conecte com GitHub"
        fi
        ;;
    4)
        echo ""
        echo "🌊 Deploy no Surge.sh..."
        echo ""
        
        if command -v surge &> /dev/null; then
            echo "🚀 Fazendo deploy..."
            surge . jackpot-game-$(date +%s).surge.sh
            echo "✅ Deploy concluído!"
        else
            echo "❌ Surge CLI não encontrado!"
            echo ""
            echo "📋 Para instalar:"
            echo "npm install -g surge"
        fi
        ;;
    5)
        echo ""
        echo "📋 INSTRUÇÕES MANUAIS:"
        echo "====================="
        echo ""
        echo "🌟 GitHub Pages:"
        echo "1. Crie conta no GitHub"
        echo "2. Crie repositório público"
        echo "3. Faça upload do index.html"
        echo "4. Vá em Settings > Pages"
        echo "5. Escolha 'Deploy from a branch'"
        echo "6. Selecione 'main' branch"
        echo "7. Acesse: https://seu-usuario.github.io/nome-do-repo"
        echo ""
        echo "🔥 Netlify:"
        echo "1. Acesse netlify.com"
        echo "2. Arraste a pasta do projeto"
        echo "3. Pronto! URL automática"
        echo ""
        echo "📦 Vercel:"
        echo "1. Acesse vercel.com"
        echo "2. Conecte com GitHub"
        echo "3. Selecione o repositório"
        echo "4. Deploy automático"
        echo ""
        echo "🌊 Surge.sh:"
        echo "1. Instale: npm install -g surge"
        echo "2. Execute: surge"
        echo "3. Siga as instruções"
        echo ""
        ;;
    *)
        echo "❌ Opção inválida!"
        ;;
esac

echo ""
echo "🎉 Deploy concluído!"
echo "🌐 Compartilhe o link com seus amigos!"
echo ""
