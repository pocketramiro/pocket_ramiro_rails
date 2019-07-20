require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  describe "When I go to the machine dashboard" do
    before :each do
      Ticket.destroy_all
      Resource.destroy_all
      ResourceType.destroy_all
      User.destroy_all
      @user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
      @r_type1 = ResourceType.create(category: "Brights Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
      @p1 = Part.create(id:1, name: 'lever', inventory: 3)

    end

    it "I can update an existing part" do
      fixed_part = {name: "lever 2000"}

      patch "/api/v1/parts/1", params: fixed_part
      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)

      expect(results[:name]).to eq("lever 2000")
      expect(results[:inventory]).to eq(3)
      expect(results[:active]).to eq(true)
    end

    # patch "cannot find Resource with that id" - yes I know
    it "I cannot update an existing resource_type if it does not exist" do
      fixed_part = {name: "lever 2000"}

      patch "/api/v1/parts/2", params: fixed_part
      # expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_names: true)

      expect(results).to eq({
        "Error": "Part does not exist."
        })

    end
  end
end
