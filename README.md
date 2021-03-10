# Achernar

A simulation system for surplus energy market.

## Installation

```bash
git clone https://github.com/tighug/achernar.git
```

## Usage

Prepare `.env`.

```bash
cp .env.example .env
```

Start up the servers.

```bash
# dev
docker-compose -f docker-compose.dev.yml up -d

# prod
docker-compose up -d
```

Now, you can operate through [achernar-admin-app](https://github.com/tighug/achernar-admin-app).

## LICENSE

[MIT](./LICENSE)
