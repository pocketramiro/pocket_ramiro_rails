require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  it "I can see a specific user in the system" do
    Resource.destroy_all
    User.destroy_all
    ResourceType.destroy_all
    user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password: "password", role: 0, phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")

    get "/api/v1/users/1"

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:name]).to eq("Cameron Marks")
    expect(results[:email]).to eq("cameron_marks@greatdivide.com")
    expect(results[:id]).to eq(1)
    expect(results[:active]).to eq(true)
    expect(results[:phone_number]).to eq(7208674848)
  end

  # need to add test for if id is not active
end
