# 🚀 Guia Rápido - Upload para GitHub

## 🎯 **Método Automático (Recomendado):**

```bash
./upload_github.sh
```

**O script faz tudo automaticamente:**
- ✅ Configura o Git
- ✅ Cria .gitignore
- ✅ Faz commit dos arquivos
- ✅ Configura o repositório remoto
- ✅ Envia para o GitHub

## 📋 **Passo a Passo Manual:**

### **1. 🔧 Configurar Git (primeira vez):**
```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

### **2. 📁 Inicializar Repositório:**
```bash
git init
git add .
git commit -m "🎰 Jackpot Game - Versão Web"
```

### **3. 🌟 Criar Repositório no GitHub:**
1. Acesse: https://github.com/new
2. Nome: `jackpot-game` (ou outro nome)
3. Descrição: `Jogo de Jackpot em HTML/CSS/JavaScript`
4. Marque `Public`
5. **NÃO** marque `Add a README file`
6. Clique `Create repository`

### **4. 🔗 Conectar com GitHub:**
```bash
git remote add origin https://github.com/SEU-USUARIO/jackpot-game.git
git branch -M main
git push -u origin main
```

### **5. 🌐 Ativar GitHub Pages:**
1. Vá em `Settings > Pages`
2. Escolha `Deploy from a branch`
3. Selecione `main` branch
4. Clique `Save`
5. Acesse: `https://SEU-USUARIO.github.io/jackpot-game`

## 🎉 **Resultado:**

**Seu jogo estará disponível em:**
- 📁 **Repositório**: `https://github.com/SEU-USUARIO/jackpot-game`
- 🌐 **Jogo Online**: `https://SEU-USUARIO.github.io/jackpot-game`

## 🔗 **Compartilhar:**

**Envie o link para seus amigos:**
- 🌐 **Link do jogo**: `https://SEU-USUARIO.github.io/jackpot-game`
- 📁 **Código fonte**: `https://github.com/SEU-USUARIO/jackpot-game`

## 💡 **Dicas:**

- ✅ **Nome do repositório**: Use `jackpot-game` ou `slot-machine`
- ✅ **Descrição**: Adicione emojis e descrição clara
- ✅ **README**: O arquivo README.md já está incluído
- ✅ **Público**: Marque como público para GitHub Pages gratuito

## 🚀 **Comandos Rápidos:**

```bash
# Upload automático
./upload_github.sh

# Ou manual
git add .
git commit -m "🎰 Atualização do jogo"
git push
```

**🎮 Pronto! Seu jogo estará online para todos jogarem!**
