require "rails_helper"

RSpec.describe TicketSerializer do
  descibe "When calling for a ticket" do
    it "returns the related user" do
      Ticket.destroy_all
      Resource.destroy_all
      User.destroy_all
      ResourceType.destroy_all

      user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password: "password", role: 0, phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
      ResourceType.create(id: 1, category:"vehicle", company:"Brew Bears")
      Resource.create(id: 1, resource_type_id:1, name:"van", cost:"75000", user_id:1)
      ticket = Ticket.create(table_key: 1, table_name: "Resources",user_id:1, notes:"needs oil change", priority:1)

      get "/api/v1/tickets"
      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_name: true)
      expect(results.count).to eq(3)
      expect(results[0]["table_key"]).to be_a(Integer)
      expect(results[0]["table_name"]).to be_a(String)
      expect(results[0]["notes"]).to be_a(String)
      expect(results[0]["user"]["name"]).to be_a("Cameron Marks")
    end
  end

end

RSpec.describe TicketSerializer do
  descibe "When calling for a ticket" do
    it "returns the related user" do

    end
  end

end
