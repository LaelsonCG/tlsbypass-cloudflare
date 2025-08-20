# 🛡 TLSBypass Cloudflare

Servidor **Bypass WebSocket + TLS** que só aceita conexões via domínio ou subdomínio com **proxy do Cloudflare ativo** (não DNS-only). Ideal para uso com **VPN ou túnel SSH**.

---

## ⚙️ Requisitos

1. **Dropbear SSH** instalado na porta **115** (pode ser feito via SSHPLUS).  
2. Sistema Linux com **bash**, **wget** e **Python 3** instalado.

---

## 🚀 Instalação

Execute o comando abaixo para instalar o TLSBypass:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/LaelsonCG/tlsbypass-cloudflare/main/instalar.sh)
```

O comando irá baixar e configurar automaticamente o servidor, incluindo todas as dependências necessárias.

---

## 🖥 Uso:

- O servidor TLSBypass será iniciado na porta 8080.

- Conecte seu cliente VPN ou SSH na porta 8080 do servidor.

- Apenas domínios ou subdomínios com Cloudflare Proxy ativo serão aceitos; conexões DNS-only serão bloqueadas.

---

### Modelos de Payload:

Funciona exclusivamente e somente com métodos que usam **proxy da operadora (host no cloudflare)*

```bash
[split]ACL /bypass HTTP/1.1[crlf]Host: [host][crlf]Upgrade: Websocket[crlf][crlf]
```
```bash
[split]GET /bypass HTTP/1.1[crlf]Host: [host][crlf]Upgrade: Websocket[crlf][crlf]
```
```bash
GET /bypass HTTP/1.1[crlf]Host: [host][crlf]Upgrade: Websocket[crlf][crlf]
```

```bash
ACL /bypass HTTP/1.1[crlf]Host: [host][crlf]Upgrade: Websocket[crlf][crlf]
```
---

## 📌 Observações:

- Certifique-se de que a porta 8080 está liberada no firewall e roteadores.

- O serviço mantém o túnel para Dropbear na porta 115, garantindo compatibilidade com SSH/VPN.
