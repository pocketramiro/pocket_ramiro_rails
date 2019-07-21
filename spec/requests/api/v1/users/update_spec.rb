require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  before :each do
    Ticket.destroy_all
    Note.destroy_all
    Resource.destroy_all
    User.destroy_all
    ResourceType.destroy_all
    @user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password: "password", role: "admin", phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "I can update a user" do
    update_user = {phone_number: 5673912843}

    patch "/api/v1/users/#{@user.id}", params: update_user

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(results[:name]).to eq("Cameron Marks")
    expect(results[:email]).to eq("cameron_marks@greatdivide.com")
    expect(results[:active]).to eq(true)
    expect(results[:phone_number]).to eq(5673912843)
  end
end
