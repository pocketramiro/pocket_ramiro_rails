require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  before :each do
    @user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password_digest: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
    @r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
  end

  describe "When I go to the machine dashboard" do
    it "I can create a new resource_type in the system" do
      new_resource_type = {
            category: "Bright Tank",
            company: "Mueller",
            contact_number: 5419307880,
            contact_name: "Sheryl Michiel",
            active: true,
            manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor"
      }
      post "/api/v1/resource_types", params: new_resource_type

      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)
      resource_type = ResourceType.last

      expect(resource_type[:category]).to eq("Bright Tank")
      expect(resource_type[:company]).to eq("Mueller")
      expect(resource_type[:contact_name]).to eq("Sheryl Michiel")
      expect(resource_type[:contact_number]).to eq(5419307880)
      expect(resource_type[:active]).to eq(true)

    end

    it "shows me an error message if the resource_type does not save" do
      new_resource_type = {
            company: "Mueller",
            contact_number: 5419307880,
            contact_name: "Sheryl Michiel",
            active: true,
            manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor"
      }
      post "/api/v1/resource_types", params: new_resource_type

      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)
      resource = Resource.last

      expect(resource).to eq(nil)
      expect(results).to eq({
        "Error": "Resource type could not be created."
        })
    end
  end
end
