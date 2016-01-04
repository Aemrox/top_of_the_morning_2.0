require 'bundler'
Bundler.require(:default, :development, :production)

db = URI.parse(ENV['DATABASE_URL'] || URI.parse('postgres://user:pass@localhost/db/topofthemorning_development')

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'SQL_ASCII'

)

require_relative '../app/controllers/application_controller.rb'
require_all 'app/models'

require "open-uri"
require "json"
