require 'sinatra'
require 'mysql2'
require 'erb'

client = Mysql2::Client.new(:host => "localhost", :username => "root",  :database => "Amazon")

get '/' do
  sql = "SELECT * FROM items"
  statement = client.prepare(sql)
  @results = statement.execute()
  @message = "下記のリンクを選択してください"
  erb :view
end

get '/:item' do
  sql = "SELECT count(*) as cnt FROM items WHERE item_id='" + params[:item] + "'"
  statement = client.prepare(sql)
  @cnt = statement.execute()
  sql = "select name, harvest from work inner join sellers on work.seller_id = sellers.seller_id where item_id = '" + params[:item] + "' order by harvest desc limit 5;"
  statement = client.prepare(sql)
  @results = statement.execute()
  erb :view2
end

not_found do
  "Not Found!"
end

error do
  "ERROR!"
end
