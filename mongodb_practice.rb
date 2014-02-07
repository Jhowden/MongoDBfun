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
puts coll.find_one

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

# puts coll.find("i" => {"$gt" => 90} ).to_a
# puts coll.find("i" => {"$gt" => 15, "$lte" => 19} ).to_a

spacing
# Selecting a subset of fields for a query

# data = coll.find({ "_id" => BSON::ObjectId('52f5465d2774e23258000001')}, :fields => ["name", "type"]).to_a
# puts data.first["name"]
# puts data.first["type"]
# new_data = coll.find("name" => "Jonathan").to_a
# puts new_data.first["name"]

spacing
# Querying with regex

# puts coll.find({"name" => /^J/}).to_a

params = {'search' => "tha"}
search_string = params['search']
puts coll.find({"name" => /#{search_string}/}).to_a

spacing
# Updating documents with update

doc["name"] = "The Big Slamma Jamma"
coll.update({"_id" => BSON::ObjectId('52f558772774e232ea000001')}, doc)
puts coll.find({"_id" => BSON::ObjectId('52f558772774e232ea000001')}).to_a

spacing
# Deleting Documents with remove

# coll.remove("i" => 71)
# puts coll.count
# puts coll.find("i" => 71).to_a

# coll.remove
puts coll.count

spacing
# Creating an index

coll.create_index("i")

# puts coll.find("_id" => BSON::ObjectId('52f558772774e232ea000001')).explain
# puts
# puts coll.find("i" => 49).explain
# puts
# puts coll.find("type" => "Human").explain

puts coll.index_information

spacing
# Dropping an index, indexes, collections, and a database

coll.drop_index("i_1")
puts coll.index_information

# coll.drop_indexes

# coll.drop
# puts db.collection_names.inspect

# client.drop_database("mydb")
client.database_names

