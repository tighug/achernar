# Power Market

複数コンテナで構築する、余剰電力市場のWebサービス。

---

## インストール

```bash
$ git clone https://github.com/tighug/power_market.git
```

---

## セットアップ

#### 1. `.env.template`を元に自分用の`env`を作成

```bash
$ cp .env.template .env
```

#### 2. 作成した`env`ファイルを書き換える

```
# replace these with your settings

# USER
USER=test_user
PASSWORD=test_password
EMAIL=test_email@test.com

# MYSQL
MYSQL_DATABASE=test_db
MYSQL_ROOT_PASSWORD=test_root_password
MYSQL_USER=test_user
MYSQL_PASSWORD=test_password
```

#### 3. `docker-compose`でコンテナを立ち上げる

このリポジトリ内で、以下を実行。

```bash
$ docker-compose up
```

---

## 開発

#### コンテナにアクセスする

`attach`コマンドでコンテナ内にアクセスできる。

```bash
$ docker attach [Container name]
```
