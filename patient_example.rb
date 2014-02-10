require 'mongo'
include Mongo

client = MongoClient.new
db = client.db("hospital")

patients = db.collection("patients")

seed_data = [ 
	{
		'_id' => 1,
		'name' => "Joe Schmoe",
		'age' => 30,
		'illness' => 'Flu',
		'doctor' => ["J.D."],
		'room_number' => 32
	},
	{
		'_id' => 2,
		'name' => "Jane Doe",
		'age' => 63,
		'illness' => 'Broken leg',
		'doctor' => ["J.D."],
		'room_number' => 24
	}
]

patients.insert(seed_data)
# patients.find.each { |row| puts row.inspect }

class Patient

	attr_reader :name, :age, :illness, :doctor, :room_number, :healed

	def initialize(name, age, illness, doctor, room_number)
		@name = name
		@age = age
		@illness = illness
		@doctor = doctor
		@room_number = room_number
		@healed = false
	end

	def healed?
		healed
	end

end


patients.drop() # Reset the database