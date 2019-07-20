require 'rails_helper'

RSpec.describe 'as a registered user', :type => :request do
  before :each do
    Ticket.destroy_all
    Resource.destroy_all
    ResourceType.destroy_all
    User.destroy_all
    User.create(id:1, name:"jennica", email:"jennica.stiehl@gmail.com", password_digest:"password", role:0)
    ResourceType.create(id: 1, category:"vehicle", company:"Brew Bears")
    Resource.create(id: 3, resource_type_id:1, name:"van", cost:"75000", user_id:1)
  end

  describe 'when i go to the ticket dashboard' do
    it 'I can add a ticket to the system' do
      User.create(id:1, name:"jennica", email:"jennica.stiehl@gmail.com", password:"password", role:0)

      params = {
        priority: "medium",
        notes: "needs cleaning",
        table_key: 3,
        table_name: "Resource",
        user_id: 1
      }
      post '/api/v1/resources/3/tickets', params: params
      ticket = Ticket.last
      data = JSON.generate(ticket)

      expect(response).to be_successful

      expect(JSON.parse(response.body)["priority"]).to eq("medium")
      expect(JSON.parse(response.body)["notes"]).to eq("needs cleaning")
      expect(JSON.parse(response.body)["table_key"]).to eq(3)
      expect(JSON.parse(response.body)["table_name"]).to eq("Resources")
      expect(JSON.parse(response.body)["user_id"]).to eq(1)
    end
  end
  it 'gives an error when I cant add a ticket' do

    params = {
      priority: "medium",
      notes: "needs cleaning",
      table_key: 3,
      table_name: "Resource",
      user_id: 2,
    }
    post '/api/v1/resources/3/tickets', params: params
    ticket = Ticket.last
    results = JSON.parse(response.body, symbolize_names: true)

    expect(ticket).to eq(nil)
    expect(results[:status]).to eq("406")
    expect(results[:body]).to eq({
      "Error": "Unable to create your ticket. Maybe the resource or the user do not exist."
      })
  end
end
