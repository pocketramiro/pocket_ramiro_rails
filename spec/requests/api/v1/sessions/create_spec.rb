require "rails_helper"

RSpec.describe "As a registered user", type: :request do
  before :each do
    Ticket.destroy_all
    Resource.destroy_all
    ResourceType.destroy_all
    User.destroy_all
    @user = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password_digest: "password", role: "admin", phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
  end

  describe "when I enter the correct credentials" do
    it "creates a session" do
      binding.pry

      post("/api/v1/sessions?email=#{@user.email}&password=#{@user.password}")

      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      # expect(body[:api_key]).to eq("asdf")
    end
  end

  describe "when I enter an email that is not in the db" do

  end

  describe "when I enter the wrong password" do

  end
end
