require "rails_helper"

RSpec.describe TicketSerializer do
  describe "When calling for a ticket" do
    it "returns the related user" do
      Ticket.destroy_all
      Resource.destroy_all
      User.destroy_all
      ResourceType.destroy_all

      user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password: "password", role: 0, phone_number: 7208674848, active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")

      serializer = UserSerializer.new(user)

      response = JSON.parse(serializer.to_json, symbolize_names: true)
      expect(response[:data][:attributes][:name]).to eq("Cameron Marks")
      expect(response[:data][:attributes][:id]).to eq(user.id)
    end
  end
end
