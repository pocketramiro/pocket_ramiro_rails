require 'rails_helper'

RSpec.describe 'as a registered user', :type => :request do
  before :each do
    Ticket.destroy_all
    Resource.destroy_all
    ResourceType.destroy_all
    User.destroy_all
    @user = User.create!(name: "jennica", email: "jennica.stiehl@gmail.com", password: "password", role: 'admin')
    @resourceType = ResourceType.create!(category:"vehicle", company:"Brew Bears")
    @resource = Resource.create!(resource_type_id: @resourceType.id, name:"van", cost:"75000", user_id: @user.id)
  end

  describe 'when i go to the ticket dashboard' do
    it 'I can add a ticket to the system' do
      # User.create(id:1, name:"jennica", email:"jennica.stiehl@gmail.com", password:"password", role:0)

      params = {
        priority: "medium",
        notes: "needs cleaning",
        table_key: @resource,
        table_name: "Resource",
        user_id: @user.id
      }

      post "/api/v1/resources/#{@resource.id}/tickets", params: params
      ticket = Ticket.last
      data = JSON.generate(ticket)

      expect(response).to be_successful

      expect(JSON.parse(response.body)["priority"]).to eq("medium")
      expect(JSON.parse(response.body)["notes"]).to eq("needs cleaning")
      expect(JSON.parse(response.body)["table_key"]).to eq(@resource.id)
      expect(JSON.parse(response.body)["table_name"]).to eq("Resources")
      expect(JSON.parse(response.body)["user_id"]).to eq(@user.id)
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
