# goose
https://github.com/pressly/goose

## install
```
go get bitbucket.org/liamstask/goose/cmd/goose
```

### 設定
- `./db/dbconf.yml`で設定したDBを作成する
- dockerが立ち上がっていれば下記のコマンドでmysqlに入りDB作成
```
$ mysql -u root -p --host 127.0.0.1 (password: mysql)
mysql> create database <database_name>
```

### 各種コマンド
- statusの確認
```
goose status
```

- migration file作成(今回はusersテーブル作成)
```
goose create create_users_table sql
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
goose up
```

- migrationをrollback
```
goose down
```
