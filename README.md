# TLSBypass Cloudflare

Servidor Bypass WebSocket + TLS que só aceita conexões via domínio ou subdomínio com proxy do Cloudflare ativo (não DNS-only). Ideal para uso com VPN ou túnel SSH.

---

## Requisitos

1. **Dropbear SSH** instalado na porta 115 (pode ser feito via SSHPLUS).  
2. Sistema Linux com `bash`, `wget` e Python 3 instalado.

---

## Instalação

Execute o comando abaixo para instalar o TLSBypass:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/LaelsonCG/tlsbypass-cloudflare/main/instalar.sh)```

O comando irá baixar e configurar automaticamente o servidor, incluindo todas as dependências necessárias.

## Uso:

- O ser- vidor TLSBypass será iniciado na porta 8080.

- Conecte seu cliente VPN ou SSH na porta 8080 do servidor.

- Apenas domínios ou subdomínios com Cloudflare Proxy ativo serão aceitos; conexões DNS-only serão bloqueadas.

## Observações

- Certifique-se de que a porta 8080 está liberada no firewall e roteadores.

- O serviço mantém o túnel para Dropbear na porta 115, garantindo compatibilidade com SSH/VPN.
