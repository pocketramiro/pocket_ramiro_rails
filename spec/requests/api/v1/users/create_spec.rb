require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  before :each do
    Resource.destroy_all
    User.destroy_all
    ResourceType.destroy_all
  end

  it "I can see a specific resource in the system" do
    new_user = {
      id: 1,
      name: "Cameron Marks",
      email: "cameron_marks@greatdivide.com",
      password_digest: "password",
      role: "admin",
      phone_number: 7208674848,
      active: true,
      created_at: "2015-11-29 00:00:00",
      updated_at: "2019-06-01 00:00:00"
    }

    post "/api/v1/users", params: new_user

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[:name]).to eq("Cameron Marks")
    expect(results[:email]).to eq("cameron_marks@greatdivide.com")
    expect(results[:id]).to eq(1)
    expect(results[:active]).to eq(true)
    expect(results[:phone_number]).to eq(7208674848)
  end

  it "shows me an error message if user does not save" do
    new_user = {
      id: 1,
      name: "Cameron Marks",
      password_digest: "password",
      role: "admin",
      phone_number: 7208674848,
      active: true,
      created_at: "2015-11-29 00:00:00",
      updated_at: "2019-06-01 00:00:00"
    }
    post "/api/v1/users", params: new_user

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    user = User.last
    expect(user).to eq(nil)
    expect(results).to eq({
      "Error": "User could not be created."
      })

  end
end
