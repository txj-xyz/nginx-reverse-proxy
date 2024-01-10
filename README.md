# `nginx-reverse-proxy`

Just a reverse proxy to expose Non-SSL products on an SSL endpoint

# `ENV` Variables

These variables can be overridden via `.env` file.

|     Key      |          Value          |
|--------------|-------------------------|
| LISTEN_HOST  | `subdomain.example.com` |
| PROXY_PORT   | `8080`                  |
| PROXY_IP     | `127.0.0.1`             |

# Running the image

You can start a docker instance of this reverse proxy this way:

```bash
# Expose port 443 on the host and expose our proxy instance
$ docker run --name my-proxy-instance \
    -e LISTEN_HOST=example.com \
    -e PROXY_PORT=8080 \
    -e PROXY_IP=10.0.0.1 \
    -d -p 443:443 nginx-reverse-proxy:latest
```

# Building

```bash
$ docker build -t nginx-reverse-proxy:latest .
```