require_relative 'patient_example'

describe Patient do 
	let (:patient) { Patient.new("Bobby McGee", 77, "Myocardial infarction", "J.D.", 12) }

	describe "#initialize" do

		context "#name" do
			it "displays a patient's name" do
				expect(patient.name).to eq("Bobby McGee")
			end
		end

		context "#age" do
			it "displays a patient's age" do
				expect(patient.age).to eq(77)
			end
		end

		context "#illness" do
			it "displays a patient's illness" do
			  expect(patient.illness).to eq("Myocardial infarction")
			end
		end

		context "#doctor" do
			it "displays a patient's doctor" do
				expect(patient.doctor).to eq("J.D.")
			end
		end

		context "#room_number" do
			it "displays a patient's room number" do
				expect(patient.room_number).to eq(12)
			end
		end

		context "#healed" do
			it "displays if a patient is healed" do
				expect(patient.healed).to eq(false)
			end
		end
	end

	describe "#healed?" do

		context "when patient is not healed" do
			it "returns false" do
				expect(patient.healed?).to eq(false)
			end
		end
	end
end

describe Hospital do

	let (:hospital) { Hospital.new("Sacred Heart", "1 Healer Lane", 10) }

	describe "#initialize" do

		context "#name" do
			it "displays the hospital's name" do
				expect(hospital.name).to eq("Sacred Heart")
			end
		end

		context "#address" do
			it "displays the hospital's address" do
				expect(hospital.address).to eq("1 Healer Lane")
			end
		end

		context "#staff_count" do
			it "displays the hospital's staff count" do
				expect(hospital.staff_count).to eq(10)
			end
		end

		# context "#patient_count" do
		# 	it "displays the hospital's patient count" do
		# 		expect(hospital.patient_count).to eq(3)
		# 	end
		# end
	end

	describe "#add_patient" do

		let (:patients) { Mongo::Connection.new.db('patients')["patients"] }

		context "when passed a valid patient" do
			it "updates the patient count by one" do
				hospital.add_patient
				expect(patients.count).to eq(1)
			end
		end
	end
end