# coding: utf-8
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'bookmarks.db'
)

# テーブル名の単数形をクラス名とする
class Bookmark < ActiveRecord::Base
end

class User < ActiveRecord::Base
end

get '/' do
  erb :index
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username, password_hash: password)

  if user
    @user = user
    @web = Bookmark.all
    erb :weblist
  else
    erb :index, locals: { login_error: true }
  end
end

post '/weblist' do
  id = params[:id]
  name = params[:name]
  url = params[:url]
  # 新しいBookmarkレコードを作成してデータを設定
  bookmark = Bookmark.create(page_name: name, url: url, user_id: id)
  @id = id  # @idにidの値を設定
  @web = Bookmark.all
  erb :weblist
end

