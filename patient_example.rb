require 'mongo'
include Mongo

client = MongoClient.new
db = client.db("hospital")

$patients = db.collection("patients")

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

$patients.insert(seed_data)
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

class Hospital

	attr_reader :name, :address, :staff_count, :patient_count

	def initialize(name, address, staff_count)
		@name = name
		@address = address
		@staff_count = staff_count
		# @patient_count = patient_count
	end

	def add_patient
		patient_name = get_name
		patient_age = get_age.to_i
		patient_illness = get_illness
		patient_doctor = ["J.D."]
		patient_room_number = rand(1..100)

		patient_info = { name: patient_name,
										 age: patient_age,
										 illness: patient_illness,
										 doctor: patient_doctor,
										 room_number: patient_room_number }

		$patients.insert(patient_info)
	end

	private

	def prompt
		print "> "
		gets.chomp
	end

	def get_name
		puts "What is your name?"
		prompt
	end

	def get_age
		puts "How old are you?"
		prompt
	end

	def get_illness
		puts "What are you suffering from?"
		prompt
	end
end


$patients.drop() # Reset the database