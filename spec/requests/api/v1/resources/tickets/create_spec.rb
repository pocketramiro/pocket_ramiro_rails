require 'rails_helper'

RSpec.describe 'as a registered user', :type => :request do
  before :each do
    Ticket.destroy_all
    Resource.destroy_all
    ResourceType.destroy_all
    User.destroy_all
  end

  describe 'when i go to the ticket dashboard' do
    it 'I can add a ticket to the system' do
      User.create(id:1, name:"jennica", email:"jennica.stiehl@gmail.com", password:"password", role:0)

      params = {
        priority: "medium",
        notes: "needs cleaning",
        table_key: 3,
        table_name: "Resource",
        user_id: 1,
      }
      post '/api/v1/resources/3/tickets', params: params
      ticket = Ticket.last
      data = JSON.generate(ticket)

      expect(response).to be_successful
      # binding.pry
      expect(JSON.parse(response.body)["priority"]).to eq("medium")
      expect(JSON.parse(response.body)["notes"]).to eq("needs cleaning")
      expect(JSON.parse(response.body)["table_key"]).to eq(3)
      expect(JSON.parse(response.body)["table_name"]).to eq("Resource")
      expect(JSON.parse(response.body)["user_id"]).to eq(1)
    end
  end
end
