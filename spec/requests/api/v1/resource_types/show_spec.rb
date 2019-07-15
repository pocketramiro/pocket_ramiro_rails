require "rails_helper"

RSpec.describe "as a registered user", type: :request do


  it "I can see a specific resource type in the system" do
    user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password_digest: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
    r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)

    get "/api/v1/resource_types/1"

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:category]).to eq("Bright Tank")
    expect(results[:company]).to eq("Mueller")
    expect(results[:contact_name]).to eq("Sheryl Michiel")
    expect(results[:active]).to eq(true)
  end

  # need to add test for if id is not active
end
