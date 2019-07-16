require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  before :each do
    @user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password_digest: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
    @r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
  end

  describe "When I go to the machine dashboard" do
    it "I can create a new part in the system" do
      new_part = {
            name: "Tank patch",
            inventory: 1,
            active: true
      }
      post "/api/v1/parts", params: new_part

      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)
      part = Part.last

      expect(part[:name]).to eq("Tank patch")
      expect(part[:inventory]).to eq(1)
      expect(part[:active]).to eq(true)

    end

    it "shows me an error message if the part does not save" do
      new_part = {
            name: nil,
            inventory: 1,
            active: true
      }
      post "/api/v1/parts", params: new_part

      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)
      resource = Part.last

      expect(resource).to eq(nil)
      expect(JSON.parse(response.body)).to eq(
        {"status" =>  "406", "body" => {
          "error" => "Unable to create your part."
          }}
      )
    end
  end
end
