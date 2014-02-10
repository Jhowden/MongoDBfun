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