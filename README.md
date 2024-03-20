# paizacloudsinatra
ハンズオン用の資料です。
# Sinatra
WEBアプリケーション部分は、**sinatra** を使用します。
https://sinatrarb.com/
# MySQL
データベースは、**MySQL** を使用します。
https://www.mysql.com/jp/
# Paiza Cloud
開発及び動作確認環境は、**Paiza Cloud** を使用します。
https://paiza.cloud/ja/
# Github clone
次のコマンドを実行すると、repositories がクローンされます。
```
git clone https://github.com/superrino130/paizacloudsinatra.git
```
# MySQL へログイン・ログアウト
```
# ログイン
mysql -u root
# ログアウト
quit
```
# MySQL へのデータ追加
次のコマンドを実行すると、MySQL へデータが追加されます。
```
# データベース生成
create database Amazon;
# データベース一覧
show databases;
# 使用するデータベースの設定
use Amazon;
# テーブル一覧
show tables;
# テーブル生成
## 商品テーブル：goods
create table Amazon.goods (good_id VARCHAR(50) NOT NULL PRIMARY KEY, jname VARCHAR(50), ename VARCHAR(50));
## セーラーテーブル：sellers
create table Amazon.sellers (seller_id VARCHAR(50) NOT NULL PRIMARY KEY, name VARCHAR(50), people INT);
## 作業テーブル：work
create table Amazon.work (good_id VARCHAR(50) NOT NULL, seller_id VARCHAR(50) NOT NULL, name VARCHAR(50), harvest INT);
## テーブルの内容確認
describe goods;
# テーブルへデータ挿入
INSERT INTO goods VALUES ('G0001','いちご','strawberry');
INSERT INTO goods VALUES ('G0002','メロン','melon');
INSERT INTO goods VALUES ('G0003','すいか','watermelon');
INSERT INTO goods VALUES ('G0004','みかん','mandarin orange');
INSERT INTO goods VALUES ('G0005','りんご','apple');
INSERT INTO goods VALUES ('G0006','日本梨','Japanese pear');
INSERT INTO goods VALUES ('G0007','西洋梨','pear');
# テーブルへデータ一括挿入
LOAD DATA LOCAL INFILE '/home/ubuntu/paizacloudsinatra/data/goods.csv' INTO TABLE goods COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/home/ubuntu/paizacloudsinatra/data/sellers.csv' INTO TABLE sellers COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/home/ubuntu/paizacloudsinatra/data/work.csv' INTO TABLE work COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
```
