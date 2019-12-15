# golang-migrate/migrate
https://github.com/golang-migrate/migrate

## install
```
brew install golang-migrate
```

- ↓で行けると思ったが、できなかったので、brewにて導入
```
$ go get -u -d github.com/golang-migrate/migrate/cmd/migrate
$ cd $GOPATH/src/github.com/golang-migrate/migrate/cmd/migrate
$ git checkout $TAG  # e.g. v4.1.0
$ go build -tags 'postgres' -ldflags="-X main.Version=$(git describe --tags)" -o $GOPATH/bin/migrate github.com/golang-migrate/migrate/cmd/migrate
```

### 設定
- `./db/dbconf.yml`で設定したDBを作成する
- dockerが立ち上がっていれば下記のコマンドでmysqlに入りDB作成(今回は`golang_migrate`にしましょう)
```
$ mysql -u root -p --host 127.0.0.1 (password: mysql)
mysql> create database <database_name>
```

このサンプルでは`golang_migrate`を想定しています


### 各種コマンド
- migration file作成(今回はusersテーブル作成)
```
mkdir migrations
touch migrations/1_create_users_table.up.sql
touch migrations/1_create_users_table.down.sql
```

- statusの確認
```
migrate -database 'mysql://root:mysql@tcp(127.0.0.1:3306)/golang_migrate' -path ./migrations version
```

- upファイルの作成
```sql
CREATE TABLE IF NOT EXISTS users (id int);
```

- downファイルの作成
```sql
DROP TABLE IF EXISTS users;
```

- migrationを実行
```
migrate -database 'mysql://root:mysql@tcp(127.0.0.1:3306)/golang_migrate' -path ./migrations up
```

- migrationをrollback
```
migrate -database 'mysql://root:mysql@tcp(127.0.0.1:3306)/golang_migrate' -path ./migrations down
```
