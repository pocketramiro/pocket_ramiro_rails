require 'rails_helper'

RSpec.describe 'as a registered user', :type => :request do
  describe 'when i go to the ticket dashboard' do
    before :each do
      Ticket.destroy_all
      Resource.destroy_all
      ResourceType.destroy_all
      User.destroy_all
      
      User.create(id:1, name:"jennica", email:"jennica.stiehl@gmail.com", password_digest:"password", role:0)
      ResourceType.create(id: 1, category:"vehicle", company:"Brew Bears")
      ResourceType.create(id: 2, category:"equipment", company:"Brew Bears")
      Resource.create(id: 1, resource_type_id:1, name:"van", cost:"75000", user_id:1)
      Resource.create(id: 2, resource_type_id:1, name:"car", cost:"25000", user_id:1)
      Resource.create(id: 3, resource_type_id:2, name:"bottler", cost:"5000", user_id:1)
      Ticket.create(table_key: 1, table_name: "Resources",user_id:1, notes:"needs oil change", priority:1)
      Ticket.create(table_key: 2, table_name: "Resources",user_id:1, notes:"needs new transmission", priority:3)
      Ticket.create(table_key: 3, table_name: "Resources",user_id:1, notes:"needs new top", priority:2)
    end

    it 'I can see all the active tickets in the system' do
      get '/api/v1/resources/1/tickets'
      tickets = Ticket.tickets_by_resource(1)

      expect(response).to be_successful
      results = JSON.parse(response.body, symbolize_name: true)
      expect(results.count).to eq(1)
      expect(results[0]["table_key"]).to be_a(Integer)
      expect(results[0]["table_name"]).to be_a(String)
      expect(results[0]["notes"]).to be_a(String)
    end
  end
end
