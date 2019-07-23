require "rails_helper"

RSpec.describe "As a registered user", type: :request do
  before :each do
    Ticket.destroy_all
    Resource.destroy_all
    ResourceType.destroy_all
    User.destroy_all
    @user = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password: "password", role: "admin", phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
  end

  describe "when I enter the correct credentials" do
    it "creates a session" do

      post("/api/v1/sessions?email=#{@user.email}&password=#{@user.password}")

      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:user_id]).to eq(@user.id)
      expect(body[:name]).to eq(@user.name)
      expect(body[:role]).to eq(@user.role)
    end
  end

  describe "when I enter an email that is not in the db" do
    it "throws an error with a message" do
      post("/api/v1/sessions?email=email@email.com&password=asdf")
      expect(response.status).to eq(403)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:message]).to eq("Email does not exist in database.")
    end
  end

  describe "when I enter the wrong password" do
    it "throws an error with a message" do
      post("/api/v1/sessions?email=#{@user.email}&password=butts")
      expect(response.status).to eq(403)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:message]).to eq("Bad credentials.")
    end
  end
end
