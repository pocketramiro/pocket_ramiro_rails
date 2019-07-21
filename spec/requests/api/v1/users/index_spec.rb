require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  it "I can see all users in the system" do
    Resource.destroy_all
    User.destroy_all
    ResourceType.destroy_all
    @user1  = User.create(name: "Cameron Marks", email: "marks@greatdivide.com", password_digest: "password",  password: "password", role: 'admin', phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
    @user2  = User.create(name: "Carrie Lu", email: "carrie@greatdivide.com", password_digest: "password",  password: "password", role: 'admin', phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")

    get "/api/v1/users"

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[0][:name]).to eq("Cameron Marks")
    expect(results[0][:email]).to eq("marks@greatdivide.com")
    expect(results[0][:id]).to eq(@user1.id)
    expect(results[0][:active]).to eq(true)
    expect(results[0][:phone_number]).to eq(7208674848)
    expect(results[1][:name]).to eq("Carrie Lu")
    expect(results[1][:email]).to eq("carrie@greatdivide.com")
    expect(results[1][:id]).to eq(@user2.id)
    expect(results[1][:active]).to eq(true)
  end

  # need to add test for if id is not active
end
