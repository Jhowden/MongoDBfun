require_relative 'patient_example'

describe Hospital do

  let (:hospital) { Hospital.new("Sacred Heart", "1 Healer Lane", 10) }

	let (:db) { MongoClient.new.db('hospital') }
	let (:patients) { db.collection("patients") }

	after(:each) do
		patients.drop()
	end

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

		context "#list_of_available_rooms" do
			it "displays the count of available rooms" do
				expect(hospital.list_of_available_rooms.count).to eq(8)
			end
		end

		context "#patient_count" do
			it "displays the hospital's patient count" do
				expect(hospital.patient_count).to eq(0)
			end
		end
	end

	describe "#add_patient" do

		context "when passed a valid patient" do
			it "updates the patient count by one" do
				hospital.add_patient("Bob", 77, "Hip Displasia", ["J.D."])
				expect(patients.count).to eq(1)
			end
		end
	end

	describe "#discharge_patient" do

		context "when finding a listed patient" do
			it "descreases the patient count by one" do
				hospital.add_patient("Bob", 77, "Hip Displasia", ["J.D."])
				hospital.discharge_patient("Bob")
				expect(patients.count).to eq(0)
			end
		end
	end

	describe "#update_patient_information" do

		context "when passed a valid field" do
			it "updates the patient's information" do
				hospital.add_patient("Bob", 77, "Hip Displasia", ["J.D."])
				hospital.update_patient_information("name", "Bob", "Bobby")
				expect(patients.find_one["name"]).to eq("Bobby")
			end
		end
	end

	describe "#heal_patient" do

		context "when healing a patient" do
			it "updates patient's heal field to true" do
				hospital.add_patient("Bob", 77, "Hip Displasia", ["J.D."])
				hospital.heal_patient("name", "Bob")
				expect(patients.find_one["healed"]).to eq(true)
			end
		end
	end
end
