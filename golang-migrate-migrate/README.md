# golang-migrate/migrate
https://github.com/golang-migrate/migrate

## install
- mysql用にget
```
go get -tags 'mysql' -u github.com/golang-migrate/migrate/cmd/migrate
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
```

- migration file作成(今回はusersテーブル作成)
```
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
```

- migrationをrollback
```
```
