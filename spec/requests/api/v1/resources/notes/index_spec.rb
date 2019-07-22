require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  describe "when I visit a resource's page" do
    it "shows me all notes for that resource" do
      Note.destroy_all
      Resource.destroy_all
      User.destroy_all
      ResourceType.destroy_all
      user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
      r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
      resource1 = r_type1.resources.create(name: "Bright Tank 1", cost:20000.00, user_id: 1, created_at: "2008-02-09 16:49:29", updated_at: "2008-02-09 16:49:29", active: true,id: 1)
      note1 = Note.create(id: 1, user_id: 1, table_key: 1, table_name: "Resources", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", created_at: "2019-07-05 20:35:50", updated_at: "2019-07-10 20:35:50")
      note2 = Note.create(id: 2, user_id: 1, table_key: 1, table_name: "Resources", content: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur", created_at: "2019-07-05 20:35:50", updated_at: "2019-07-10 20:35:50")

      get "/api/v1/resources/1/notes"

      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)
      expect(results[:data].count).to eq(2)
      expect(results[:data][0][:attributes][:id]).to eq(1)
      expect(results[:data][0][:attributes][:user_id]).to eq(1)
      expect(results[:data][0][:attributes][:table_key]).to eq(1)
      expect(results[:data][0][:attributes][:table_name]).to eq("Resources")
    end
  end
end
