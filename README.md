# Group Store

Esse projeto é um microserviço para o servidor de autorização e autenticação utilizando Open ID Connect.

## Environments

- Definir environments
  - PORT
  - DATABASE_URL
  - KEYCLOAK_USER
  - KEYCLOAK_PASSWORD

## Rodar o servidor

```bash
docker build -t rh_colaborador_auth .
```

```bash
docker run -d -p 8180:8080 -e KEYCLOAK_USER="" -e KEYCLOAK_PASSWORD="" -e PORT=8080 rh_colaborador_auth
```
# appbank-auth
