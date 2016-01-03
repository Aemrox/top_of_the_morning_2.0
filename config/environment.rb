require 'bundler'
Bundler.require(:default, :development)

configure :development do
	set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}
end

configure :production do
	set :database, {adapter: "activerecord-postgresql-adapter", database: ENV['DATABASE_URL'] || 'sqlite://database.db}
end

require_relative '../app/controllers/application_controller.rb'
require_all 'app/models'

require "open-uri"
require "json"
