require_relative 'patient_example'

seed_data = [ 
	{
		'_id' => 1,
		'name' => "Joe Schmoe",
		'age' => 30,
		'illness' => 'Flu',
		'doctor' => ["J.D."],
		'healed' => false,
		'room_number' => 1
	},
	{
		'_id' => 2,
		'name' => "Jane Doe",
		'age' => 63,
		'illness' => 'Broken leg',
		'doctor' => ["J.D."],
		'healed' => false,
		'room_number' => 2
	}
]

$patients.insert(seed_data)


hospital = Hospital.new("Sacred Heart", "123 Heal Ln.", 1)
hospital.list_patients
hospital.add_patient("Mike", 43, "something bad", ["J.D."])
puts
puts
hospital.list_patients
hospital.update_patient_information("name", "Mike", "Michael")
puts
puts
hospital.list_patients 
hospital.heal_patient("name", "Michael")
puts
puts
hospital.list_patients
puts
puts
hospital.discharge_patient("Michael")
puts
puts
hospital.list_patients

$patients.drop() # Reset the database