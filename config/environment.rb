require 'bundler'
Bundler.require

require './app/models/show'

configure :development do
  set :database, "sqlite3:db/database.db"
end
