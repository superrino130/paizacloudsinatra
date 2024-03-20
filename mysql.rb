require 'sinatra'
require 'mysql2'
require 'erb'

client = Mysql2::Client.new(:host => "localhost", :username => "root",  :database => "Amazon")

get '/' do
  sql = "SELECT * FROM items"
  statement = client.prepare(sql)
  @results = statement.execute()
  @message = "資格を取得して給与アップを目指そう"
  erb :view
end

get '/:item' do
  @message = params[:item]
  erb :view
end

not_found do
  "Not Found!"
end

error do
  "ERROR!"
end