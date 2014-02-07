require 'mongo'
include Mongo

def spacing
	puts "*" * 20
end

client = MongoClient.new(timeout: false)
db = client.db("mynewdb")
puts client.database_names
client.database_info.each { |info| puts info.inspect }

spacing
# Using a collection, creating documents with insert, and getting a list of collections
coll = db.collection("testCollection")

doc = { "name" => "Jonathan", "type" => "Human", "count" => 1, "info" => { "eyes" => "brown", "height" => "5'9\""}}
# id = coll.insert(doc)

puts db.collection_names.inspect

spacing
# Adding multiple documents
# 100.times { |i| coll.insert("i" => i) }

spacing
# Reading the first document in a collection, reading all of the documents
# puts coll.find_one

# coll.find.each { |row| puts row.inspect }

# puts coll.find("_id" => BSON::ObjectId('52f5465d2774e23258000001')).to_a

# coll.find("i" => 80).each { |row| puts row }

spacing
# Sorting documents in a collection

coll.find.sort(:i)

# coll.find.each { |row| puts row.inspect }

spacing
# Counting documents in a collection
puts coll.count

spacing
# Getting a set of documents with a query

puts coll.find("i" => {"$gt" => 90} ).to_a
puts coll.find("i" => {"$gt" => 15, "$lte" => 19} ).to_a
