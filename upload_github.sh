#!/bin/bash

echo ""
echo "🚀 UPLOAD PARA GITHUB 🚀"
echo "========================"
echo ""

# Verificar se git está instalado
if ! command -v git &> /dev/null; then
    echo "❌ Git não encontrado!"
    echo "📋 Para instalar:"
    echo "sudo apt install git"
    exit 1
fi

# Verificar se estamos em um repositório git
if [ ! -d ".git" ]; then
    echo "📁 Inicializando repositório Git..."
    git init
    echo "✅ Repositório inicializado!"
fi

# Configurar git (se necessário)
echo ""
echo "🔧 Configurando Git..."
echo ""

# Verificar configuração do usuário
if ! git config user.name &> /dev/null; then
    read -p "Digite seu nome de usuário do GitHub: " username
    git config user.name "$username"
fi

if ! git config user.email &> /dev/null; then
    read -p "Digite seu email do GitHub: " email
    git config user.email "$email"
fi

echo "✅ Git configurado!"

# Criar .gitignore
echo ""
echo "📝 Criando .gitignore..."
cat > .gitignore << EOF
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Virtual environments
venv/
env/
ENV/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log

# Temporary files
*.tmp
*.temp
EOF

echo "✅ .gitignore criado!"

# Adicionar arquivos
echo ""
echo "📦 Adicionando arquivos..."
git add .

# Fazer commit
echo ""
echo "💾 Fazendo commit..."
git commit -m "🎰 Jackpot Game - Versão Web

✨ Recursos:
- Interface web moderna com HTML/CSS/JavaScript
- Efeitos visuais avançados (partículas, animações, gradientes)
- Design responsivo (desktop, tablet, mobile)
- Sistema de apostas e jackpot progressivo
- Histórico de jogadas
- Funciona offline

🚀 Como executar:
- ./JOGAR.sh (servidor local)
- Abrir index.html diretamente no navegador

🌐 Deploy:
- ./deploy.sh (hospedagem gratuita)
- GitHub Pages, Netlify, Vercel, Surge.sh"

echo "✅ Commit realizado!"

# Verificar se já existe remote
if git remote get-url origin &> /dev/null; then
    echo ""
    echo "🔄 Repositório já configurado!"
    echo "📋 Remote atual: $(git remote get-url origin)"
    echo ""
    read -p "Deseja alterar o repositório? (y/n): " change_repo
    
    if [ "$change_repo" = "y" ] || [ "$change_repo" = "Y" ]; then
        read -p "Digite a URL do novo repositório: " new_repo
        git remote set-url origin "$new_repo"
        echo "✅ Remote atualizado!"
    fi
else
    echo ""
    echo "🔗 Configurando repositório remoto..."
    echo ""
    echo "📋 Opções:"
    echo "1. Criar novo repositório no GitHub"
    echo "2. Usar repositório existente"
    echo ""
    read -p "Escolha uma opção (1-2): " option
    
    case $option in
        1)
            echo ""
            echo "🌟 Para criar novo repositório:"
            echo "1. Acesse: https://github.com/new"
            echo "2. Nome: jackpot-game (ou outro nome)"
            echo "3. Descrição: Jogo de Jackpot em HTML/CSS/JavaScript"
            echo "4. Marque 'Public'"
            echo "5. NÃO marque 'Add a README file'"
            echo "6. Clique 'Create repository'"
            echo ""
            read -p "Digite a URL do repositório criado: " repo_url
            ;;
        2)
            read -p "Digite a URL do repositório existente: " repo_url
            ;;
        *)
            echo "❌ Opção inválida!"
            exit 1
            ;;
    esac
    
    git remote add origin "$repo_url"
    echo "✅ Remote configurado!"
fi

# Fazer push
echo ""
echo "🚀 Enviando para o GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 SUCESSO! Projeto enviado para o GitHub!"
    echo ""
    echo "📋 Próximos passos:"
    echo "1. 🌐 Ativar GitHub Pages:"
    echo "   - Vá em Settings > Pages"
    echo "   - Escolha 'Deploy from a branch'"
    echo "   - Selecione 'main' branch"
    echo "   - Acesse: $(git remote get-url origin | sed 's/\.git$//')"
    echo ""
    echo "2. 🔗 Compartilhar o jogo:"
    echo "   - Envie o link do GitHub Pages"
    echo "   - Ou envie o arquivo index.html"
    echo ""
    echo "3. 🎮 Testar o jogo:"
    echo "   - Abra o link no navegador"
    echo "   - Teste em diferentes dispositivos"
    echo ""
else
    echo ""
    echo "❌ Erro ao enviar para o GitHub!"
    echo ""
    echo "💡 Possíveis soluções:"
    echo "1. Verifique se a URL do repositório está correta"
    echo "2. Verifique se você tem permissão para escrever"
    echo "3. Verifique sua conexão com a internet"
    echo "4. Tente novamente com: git push -u origin main"
    echo ""
fi
