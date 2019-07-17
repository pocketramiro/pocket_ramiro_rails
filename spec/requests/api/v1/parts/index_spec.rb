require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  before :each do
    Ticket.destroy_all
    Resource.destroy_all
    ResourceType.destroy_all
    User.destroy_all
  end
  it "I can see all the active parts in the system" do
    user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password_digest: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
    r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
    p1 = Part.create(id: 1, name: 'lever', inventory: 3)
    p2 = Part.create(id: 2, name: 'worm', inventory: 1)
    p3 = Part.create(id: 3, name: 'top', inventory: 2)

    get "/api/v1/parts"
    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results.count).to eq(3)
    expect(results[0][:name]).to eq("lever")
    expect(results[0][:inventory]).to eq(3)
    expect(results[1][:name]).to eq("worm")
    expect(results[0][:active]).to eq(true)
  end
end
