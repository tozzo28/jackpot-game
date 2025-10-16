#!/usr/bin/env python3
"""
Servidor web simples para o Jackpot Game
"""

import http.server
import socketserver
import webbrowser
import os
import sys
from pathlib import Path

def main():
    """Função principal"""
    print("🎰 Iniciando servidor web do Jackpot Game...")
    print("=" * 50)
    
    # Verificar se o arquivo index.html existe
    if not os.path.exists("index.html"):
        print("❌ Arquivo index.html não encontrado!")
        return
    
    # Configurar servidor
    PORT = 8000
    
    # Mudar para o diretório do script
    os.chdir(Path(__file__).parent)
    
    # Criar servidor
    Handler = http.server.SimpleHTTPRequestHandler
    
    try:
        with socketserver.TCPServer(("", PORT), Handler) as httpd:
            print(f"🚀 Servidor iniciado na porta {PORT}")
            print(f"🌐 Acesse: http://localhost:{PORT}")
            print("🎮 O jogo vai abrir automaticamente no navegador")
            print("💡 Pressione Ctrl+C para parar o servidor")
            print("")
            
            # Abrir navegador automaticamente
            webbrowser.open(f"http://localhost:{PORT}")
            
            # Iniciar servidor
            httpd.serve_forever()
            
    except KeyboardInterrupt:
        print("\n🛑 Servidor parado pelo usuário")
    except OSError as e:
        if e.errno == 98:  # Address already in use
            print(f"❌ Porta {PORT} já está em uso!")
            print("💡 Tente fechar outros servidores ou aguarde alguns segundos")
        else:
            print(f"❌ Erro ao iniciar servidor: {e}")
    except Exception as e:
        print(f"❌ Erro inesperado: {e}")

if __name__ == "__main__":
    main()
