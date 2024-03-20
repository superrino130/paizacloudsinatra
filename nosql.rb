require 'sinatra'
require 'erb'

get '/' do
  @message = "資格を取得して給与アップを目指そう"
  erb :view_test
end

get '/:item' do
  @message = params[:item]
  erb :view_test
end

not_found do
  "Not Found!"
end

error do
  "ERROR!"
end
