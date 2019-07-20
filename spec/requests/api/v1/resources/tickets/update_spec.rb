require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  describe "When I go to the machine dashboard" do
    before :each do
      Resource.destroy_all
      User.destroy_all
      ResourceType.destroy_all
      @user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
      @r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
      @resource1 = @r_type1.resources.create(name: "Bright Tank 1", cost:20000.00, user_id: 1, created_at: "2008-02-09 16:49:29", updated_at: "2008-02-09 16:49:29", active: true,id: 1)
      @ticket = Ticket.create(id: 1, table_key: 1, table_name: "Resources",user_id:1, notes:"needs oil change", priority:1)
    end

    it "I can update an existing resource ticket" do
      fixed_resource = {notes: "changed note"}

      patch "/api/v1/resources/1/tickets/1", params: fixed_resource
      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)
      expect(results[:notes]).to eq("changed note")
      expect(results[:priority]).to eq("low")
      expect(results[:active]).to eq(true)
    end

    # patch "cannot find Resource with that id" - yes I know
    it "I cannot update an existing resource if it does not exist" do
      fixed_resource = {name: "hole in tank"}

      patch "/api/v1/resources/2/tickets/2", params: fixed_resource
      # expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)

      expect(results).to eq({
        "Error": "Resource ticket does not exist."
        })

    end
  end
end
