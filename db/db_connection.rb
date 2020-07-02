require 'sqlite3'
require 'active_record'

DB_CONNECTION = ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'olympic_history.db'
)
