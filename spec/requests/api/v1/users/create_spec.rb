require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  before :each do
    Resource.destroy_all
    User.destroy_all
    ResourceType.destroy_all
  end

  it "I can create a user in the system" do
    new_user = {
      name: "Kurt Walsh",
      email: "kurt@greatdivide.com",
      password: "password",
      password_confirmation: "password",
      role: "admin",
      phone_number: 7208674848,
      active: true
    }
    post "/api/v1/users", params: new_user

    # expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[:name]).to eq("Kurt Walsh")
    expect(results[:email]).to eq("kurt@greatdivide.com")
    expect(results[:active]).to eq(true)
    expect(results[:phone_number]).to eq(7208674848)
  end

  it "shows me an error message if user already exists" do
    User.create(id: 1, name: "Kurt Walsh", email: "kurt@greatdivide.com", password: "password", role: "admin", phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
    new_user = {
      id: 1,
      name: "Kurt Walsh",
      email: "kurt@greatdivide.com",
      password: "password",
      password_confirmation: "password",
      role: "admin",
      phone_number: 7208674848,
      active: true,
      created_at: "2015-11-29 00:00:00",
      updated_at: "2019-06-01 00:00:00"
    }
    post "/api/v1/users", params: new_user

    expect(response).to_not be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to eq({
      error: "User already exists"
      })
  end

  it "shows me an error if passwords do not match" do
    new_user = {
      id: 1,
      name: "Kurt Walsh",
      email: "kurt@greatdivide.com",
      password: "password",
      password_confirmation: "asdf",
      role: "admin",
      phone_number: 7208674848,
      active: true,
      created_at: "2015-11-29 00:00:00",
      updated_at: "2019-06-01 00:00:00"
    }
    post "/api/v1/users", params: new_user

    expect(response.status).to eq(409)
    results = JSON.parse(response.body, symbolize_names: true)

    user = User.last
    expect(user).to eq(nil)
    expect(results).to eq({
      error: "Passwords must match."
      })
  end
end
