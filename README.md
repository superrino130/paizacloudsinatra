# paizacloudsinatra
ハンズオン用の資料です。
# Excel 説明資料
https://github.com/superrino130/paizacloudsinatra/blob/main/Excel/sql01.xlsm
# Sinatra
WEBアプリケーション部分は、**Sinatra** を使用します。
https://sinatrarb.com/  
[Sinatra - wikipedia](https://ja.wikipedia.org/wiki/Sinatra) とは、Rubyで作成されたオープンソースのWebアプリケーションフレームワーク、マイクロフレームワーク。
|言語|代表的なマイクロフレームワーク|
|:--:|:--:|
|Ruby|Sinatra|
|Python|Flask|
|PHP|Slim|
|Java|Spark|
# MySQL
データベースは、**MySQL** を使用します。
https://www.mysql.com/jp/
# Paiza Cloud
開発及び動作確認環境は、**Paiza Cloud** を使用します。
https://paiza.cloud/ja/  
[PaizaCloud - wikipedia](https://ja.wikipedia.org/wiki/PaizaCloud) とは、ブラウザを開くだけでエディタ、Webサーバ、DB等の開発環境が完了、OSの種類やバージョンなどに関係なくすぐに開発を進めることができる、学習や研修に最適なクラウド型開発環境サービス。
# Github clone
次のコマンドを実行すると、リポジトリ がクローンされます。
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
## 商品テーブル：items
create table Amazon.items (item_id VARCHAR(50) NOT NULL PRIMARY KEY, jname VARCHAR(50), ename VARCHAR(50));
## セーラーテーブル：sellers
create table Amazon.sellers (seller_id VARCHAR(50) NOT NULL PRIMARY KEY, name VARCHAR(50), people INT);
## 作業テーブル：work
create table Amazon.work (item_id VARCHAR(50) NOT NULL, seller_id VARCHAR(50) NOT NULL, harvest INT);
## テーブルの内容確認
describe goods;
# テーブルへデータ挿入
INSERT INTO items VALUES ('G0001','いちご','strawberry');
INSERT INTO items VALUES ('G0002','メロン','melon');
INSERT INTO items VALUES ('G0003','すいか','watermelon');
INSERT INTO items VALUES ('G0004','みかん','mandarin orange');
INSERT INTO items VALUES ('G0005','りんご','apple');
INSERT INTO items VALUES ('G0006','日本梨','Japanese pear');
INSERT INTO items VALUES ('G0007','西洋梨','pear');
# テーブルへデータ一括挿入
LOAD DATA LOCAL INFILE '/home/ubuntu/paizacloudsinatra/data/items.csv' INTO TABLE items COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/home/ubuntu/paizacloudsinatra/data/sellers.csv' INTO TABLE sellers COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/home/ubuntu/paizacloudsinatra/data/work.csv' INTO TABLE work COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
```
# SQL 例
```
# 5件のみ表示の文法、VBAでは top 5、MySQLでは limit 5
select harvest from work where item_id = 'G0005' order by harvest desc limit 5;

+---------+
| harvest |
+---------+
|  439000 |
|  132600 |
|   47900 |
|   41200 |
|   23700 |
+---------+

# 内部結合（inner join）の2重
select name, harvest from work inner join sellers on work.seller_id = sellers.seller_id where item_id = 'G0005' order by harvest desc limit 5;

+-----------+---------+
| name      | harvest |
+-----------+---------+
| 青森県    |  439000 |
| 長野県    |  132600 |
| 岩手県    |   47900 |
| 山形県    |   41200 |
| 福島県    |   23700 |
+-----------+---------+

# 内部結合（inner join）の3重
 select name, harvest, jname from work inner join sellers on work.seller_id = sellers.seller_id inner join items on items.item_id = work.item_id where items.item_id = 'G0005' order by harvest desc limit 5;

+-----------+---------+-----------+
| name      | harvest | jname     |
+-----------+---------+-----------+
| 青森県    |  439000 | りんご    |
| 長野県    |  132600 | りんご    |
| 岩手県    |   47900 | りんご    |
| 山形県    |   41200 | りんご    |
| 福島県    |   23700 | りんご    |
+-----------+---------+-----------+
```
# Sinatra の起動
下記のコマンドで、**Sinatra** が起動します。
```
ruby ./paizacloudsinatra/mysql.rb
```
