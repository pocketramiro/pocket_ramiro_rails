require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  before :each do
    @user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password_digest: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
    @r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
  end

  describe "When I go to the machine dashboard" do
    it "I can create a new resource in the system" do
      new_resource = {
        id: 1,
        resource_type_id: 1,
        user_id: 1,
        name: "Bright Tank 4",
        cost: 1.00,
        created_at: "2008-02-09 16:49:29",
        updated_at: "2008-02-09 16:49:29",
        active: true
      }
      post "/api/v1/resources", params: new_resource

      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)
      resource = Resource.last

      expect(resource[:name]).to eq("Bright Tank 4")
      expect(resource[:cost]).to eq(1.00)
      expect(resource[:user_id]).to eq(1)
      expect(resource[:active]).to eq(true)
      expect(results).to eq({
        active: true,
        cost: 1.0,
        created_at: "2008-02-09T16:49:29.000Z",
        id: 1,
        name: "Bright Tank 4",
        resource_type_id: 1,
        updated_at: "2008-02-09T16:49:29.000Z",
        user_id: 1
        })
    end

    it "shows me an error message if the resource does not save" do
      new_resource = {
        id: 1,
        name: "Bright Tank 4",
        cost: 1.00,
        created_at: "2008-02-09 16:49:29",
        updated_at: "2008-02-09 16:49:29",
        active: true
      }
      post "/api/v1/resources", params: new_resource

      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)
      resource = Resource.last

      expect(resource).to eq(nil)
      expect(results).to eq({
        "Error": "Resource could not be created."
        })
    end
  end
end
