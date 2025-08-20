#!/bin/bash

# ============================
# TLSBypass Installer
# Autor: LaelsonCG
# ============================

# ----------------------------
# Configurações
# ----------------------------
proxy_url="https://raw.githubusercontent.com/LaelsonCG/tlsbypass-cloudflare/main/tlsbypass.py"
service_url="https://raw.githubusercontent.com/LaelsonCG/tlsbypass-cloudflare/main/tlsbypass.service"
home_dir="/opt/speednet"
service_path="/etc/systemd/system/tlsbypass.service"

# Cores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

# ----------------------------
# Função de download com curl
# ----------------------------
download() {
    url=$1
    dest=$2

    # Remover arquivo antigo se existir
    if [ -f "$dest" ]; then
        echo -e "${YELLOW}🗑 Arquivo antigo encontrado: $(basename $dest) → removendo...${NC}"
        rm -f "$dest"
    fi

    echo -e "${BLUE}📥 Baixando $(basename $dest)...${NC}"
    curl -L --progress-bar -o "$dest" "$url"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Download concluído: $(basename $dest)${NC}"
    else
        echo -e "${RED}❌ Falha no download: $(basename $dest)${NC}"
        exit 1
    fi
}

# ----------------------------
# Criar diretório de instalação
# ----------------------------
echo -e "${BLUE}📂 Criando diretório de instalação: $home_dir${NC}"
mkdir -p "$home_dir"

# ----------------------------
# Baixar TLSBypass
# ----------------------------
download "$proxy_url" "$home_dir/tlsbypass.py"

# Garantir permissões
chmod +x "$home_dir/tlsbypass.py"
echo -e "${GREEN}🔧 Permissões ajustadas para tlsbypass.py${NC}"

# ----------------------------
# Baixar systemd service
# ----------------------------
download "$service_url" "$service_path"

# ----------------------------
# Ativar e iniciar serviço
# ----------------------------
echo -e "${BLUE}⚙️  Ativando e iniciando serviço TLSBypass...${NC}"
systemctl daemon-reload
systemctl enable tlsbypass.service
systemctl restart tlsbypass.service

# ----------------------------
# Verificação do status
# ----------------------------
sleep 1
status=$(systemctl is-active tlsbypass.service)
if [ "$status" == "active" ]; then
    echo -e "${GREEN}🎉 TLSBypass instalado e rodando na porta 8080!${NC}"
else
    echo -e "${RED}❌ Falha ao iniciar o serviço. Verifique os logs com: journalctl -u tlsbypass.service${NC}"
fi

echo -e "${BLUE}🚀 Instalação finalizada!${NC}"
