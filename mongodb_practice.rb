require 'mongo'
include Mongo

client = MongoClient.new(timeout: false)
client.database_names
client.database_info.each { |info| puts info.inspect }