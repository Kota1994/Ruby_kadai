require 'erb'

require 'sinatra'
require 'sinatra/reloader'
require 'sequel'
require 'sqlite3'
require 'time'
require './comment.rb'

helpers do
  include Rack::Utils; alias_method :h, :escape_html
end


get '/' do
  @comments = Comments.order_by(Sequel.desc(:posted_date))
  haml :index
end

put '/comment' do
  Comments.create({
    :name => request[:name],  #名前
    :title => request[:title], #タイトル
    :message => request[:message],  #h本文
    :posted_date => Time.now, #時間等

                  })
  redirect '/'
end

#


#
# post '/confirm' do
#   @name = params[:name]
#   @email = params[:email]
#   @content = params[:content]
#   erb :confirm
# end