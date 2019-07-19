require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  it "I can see all users in the system" do
    Resource.destroy_all
    User.destroy_all
    ResourceType.destroy_all
    user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password_digest: "password", role: 0, phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
    user  = User.create(id: 2, name: "Carrie Lu", email: "carrielu@greatdivide.com", password_digest: "password", role: 0, phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")

    get "/api/v1/users"

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[0][:name]).to eq("Cameron Marks")
    expect(results[0][:email]).to eq("cameron_marks@greatdivide.com")
    expect(results[0][:id]).to eq(1)
    expect(results[0][:active]).to eq(true)
    expect(results[0][:phone_number]).to eq(7208674848)
    expect(results[1][:name]).to eq("Carrie Lu")
    expect(results[1][:email]).to eq("carrielu@greatdivide.com")
    expect(results[1][:id]).to eq(2)
    expect(results[1][:active]).to eq(true)
  end

  # need to add test for if id is not active
end
