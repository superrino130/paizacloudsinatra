require 'sinatra'
require 'erb'

get '/' do
  @message = "資格を取得して給与アップを目指そう"
  erb :view
end

get '/rank' do
  @message = params['goods']
  erb :view
end

not_found do
  "Not Found!"
end

error do
  "ERROR!"
end