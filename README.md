# `nginx-reverse-proxy`

Just a reverse proxy to expose non-ssl products on an SSL endpoint

# `ENV` Variables

These variables can be overridden via `.env` file.

|     Key      |    Value    |
|--------------|-------------|
| LISTEN_HOST  | example.com |
| PROXY_PORT   | `8080`      |
| PROXY_IP     | 127.0.0.1   |