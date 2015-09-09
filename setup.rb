require 'pry'
require 'active_record'
require 'pg'
require_relative 'main'

# require 'main'
# require_relative 'contact2'
# require_relative 'phone'

ActiveRecord::Base.logger = Logger.new(STDOUT)

puts "Establishing connection to database..."

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contact_list',
  username: 'development',
  password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)

puts "CONNECTED"

Application.app