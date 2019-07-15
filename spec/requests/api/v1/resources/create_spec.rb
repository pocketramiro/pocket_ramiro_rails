require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  describe "When I go to the machine" do
    it "I can see all the active resources in the system" do
      user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password_digest: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
      r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
      new_resource = {
        id: 1,
        resource_type_id: 1,
        user_id: 1,
        category: "Bright Tank 4",
        cost: 1.00,
        created_at: "2008-02-09 16:49:29",
        updated_at: "2008-02-09 16:49:29",
        active: true
      }
      post "/api/v1/resources", params: new_resource

      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)
      resource = Resource.last
      binding.pry

      expect(resource[:name]).to eq("Bright Tank 4")
      expect(resource[:cost]).to eq(1.00)
      expect(resource[:user_id]).to eq(1)
      expect(resource[:active]).to eq(true)
      expect(results).to eq({
        "name": "Bright Tank 4"
        })
    end
  end
end
