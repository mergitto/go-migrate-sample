# sql-migrate
https://github.com/rubenv/sql-migrate

## install
```
go get -v github.com/rubenv/sql-migrate/...
```

## 設定
- `./dbconfig.yml`の設定(今回はもうしてあります)
- `dbconfig.yml`で設定したDBを作成する
- dockerが立ち上がっていれば下記のコマンドでmysqlに入りDB作成
```
$ mysql -u root -p --host 127.0.0.1 (password: mysql)
mysql> create database <database_name>
```

このサンプルでは`sql_migrate`で作成しています

## 各種コマンド
- 現在のversionの確認
```
sql-migrate status
```

- migration file作成
```
sql-migrate new create_users
```
- 作成されたmigrationファイルの中身の修正
```sql
-- +migrate Up
CREATE TABLE IF NOT EXISTS users (id int);

-- +migrate Down
DROP TABLE IF EXISTS users;
```

- migrationを実行
```
sql-migrate up
```

- migrationをrollback
```
sql-migrate down
```
