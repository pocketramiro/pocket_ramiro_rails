require "rails_helper"

RSpec.describe "As a logged-in user", type: :request do
  describe "When I logout by clicking logout" do
    before :each do
      Ticket.destroy_all
      Resource.destroy_all
      ResourceType.destroy_all
      User.destroy_all
      @user = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password: "password", role: "admin", phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
    end

    it "deletes the session" do
      post("/api/v1/sessions?email=#{@user.email}&password=#{@user.password}")

      delete("/api/v1/sessions/1")

      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:message]).to eq("Successfully logged out.")
    end
  end
end
