# Achernar Server

余剰電力取引システム Achernar のサーバー

---

## Installation

```bash
git clone https://github.com/tighug/achernar-server.git
```

---

## Setup

### 1. 必要なリポジトリを GitHub からクローン

bash ファイルを実行すると、自動で全てのリポジトリをクローンする。

```bash
./setup.sh
```

### 1. `.env.template`を元に自分用の`env`を作成

```bash
cp .env.template .env
```

### 2. 作成した`env`ファイルを書き換える

```txt
# replace these with your settings

# Auction DB
MYSQL_ROOT_PASSWORD=root
MYSQL_USER=user
MYSQL_PASSWORD=pass
MYSQL_DATABASE=spm_db

# Auction API
AUCTION_API_PORT=8000
AUCTION_API_DB_HOST=auction_db
AUCTION_API_DB_PORT=3306
AUCTION_API_DB_USER=user
AUCTION_API_DB_PASSWORD=pass
AUCTION_API_DB_NAME=spm_db

# Contract API
CONTRACT_API_PORT=7000
CONTRACT_API_GANACHE_HOST=ganache
CONTRACT_API_GANACHE_PORT=8545

# Admin Web
ADMIN_WEB_HOST=localhost
ADMIN_WEB_PORT=3000
ADMIN_WEB_AUCTION_API_HOST=auction_api
ADMIN_WEB_AUCTION_API_PORT=8000
ADMIN_WEB_CONTRACT_API_HOST=contract_api
ADMIN_WEB_CONTRACT_API_PORT=7000
ADMIN_WEB_PROVIDER_HOST=ganache
ADMIN_WEB_PROVIDER_PORT=8545

```

### 3. `docker-compose`でコンテナを立ち上げる

このリポジトリ内で、以下を実行。

```bash
docker-compose up -d
```

---

## 開発

### コンテナにアクセスする

`attach`コマンドでコンテナ内にアクセスできる。

```bash
docker attach [Container name]
```
