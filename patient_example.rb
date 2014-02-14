require 'mongo'
include Mongo

client = MongoClient.new
db = client.db("hospital")

$patients = db.collection("patients")

# class Patient

# 	attr_reader :name, :age, :illness, :doctor, :room_number
# 	attr_accessor :healed

# 	def initialize(name, age, illness, doctor, room_number)
# 		@name = name
# 		@age = age
# 		@illness = illness
# 		@doctor = doctor
# 		@room_number = room_number
# 		@healed = false
# 	end

# 	def healed?
# 		healed
# 	end
# end

class Hospital

	attr_reader :name, :address, :staff_count, :patient_count, :list_of_available_rooms

	def initialize(name, address, staff_count)
		@name = name
		@address = address
		@staff_count = staff_count
		@list_of_available_rooms = available_rooms
		@patient_count = count_patients
	end

	def add_patient(name, age, illness, doctor)
		patient_room_number = select_room

		patient_info = {  _id: patient_count + 1,
										  name: name,
										  age: age,
										  illness: illness,
										  doctor: doctor,
										  healed: false,
										  room_number: patient_room_number }

		$patients.insert(patient_info)
	end

	def discharge_patient(name)
		$patients.remove("name" => name)
	end

	def update_patient_information(field, old_value, new_value)
		$patients.update({ field => old_value }, { "$set" => { field => new_value }} )
	end

	def list_patients
		$patients.find.each do |row|
			row.each do |field, value|
				puts "The patient's #{field} is: #{value}"
			end
		end
	end

	def heal_patient(field, value)
		$patients.update({ field => value}, {"$set" => {"healed" => true }} )
	end

	private

	def available_rooms
		available_room_numbers = []
		rooms = (3..10)
		rooms.each {|room| available_room_numbers << room}
		available_room_numbers
	end

	def select_room
		selected_room = list_of_available_rooms.sample
		list_of_available_rooms.delete(selected_room)
		selected_room
	end

	def count_patients
		$patients.count
	end
end
