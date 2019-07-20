require "rails_helper"

RSpec.describe "as a registered user", type: :request do


  it "I can see a specific resource in the system" do
    Resource.destroy_all
    User.destroy_all
    ResourceType.destroy_all
    user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
    r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
    resource1 = r_type1.resources.create(name: "Bright Tank 1", cost:20000.00, user_id: 1, created_at: "2008-02-09 16:49:29", updated_at: "2008-02-09 16:49:29", active: true,id: 1)
    resource2 = r_type1.resources.create(name: "Bright Tank 2", cost:10000.00, user_id: 1, created_at: "2007-12-29 13:13:04", updated_at: "2007-12-29 13:13:04", active: true,id: 2)
    resource3 = r_type1.resources.create(name: "Bright Tank 4", cost:10000.00, user_id: 1, created_at: "2013-12-22 4:11:33", updated_at: "2018-12-22 4:11:33", active: false,id: 3)

    get "/api/v1/resources/1"

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:name]).to eq("Bright Tank 1")
    expect(results[:cost]).to eq(20000.00)
    expect(results[:user_id]).to eq(1)
    expect(results[:active]).to eq(true)
  end

  # need to add test for if id is not active
end
