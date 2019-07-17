require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'validations' do
    it { should validate_presence_of :table_key }
    it { should validate_presence_of :table_name }

  end

  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'instance methods' do
  end
  describe 'class methods' do
    before :each do
      Ticket.destroy_all
      Resource.destroy_all
      ResourceType.destroy_all
      User.destroy_all

      @user1 = User.create(id:1, name:"jennica", email:"jennica.stiehl@gmail.com", password_digest:"password", role:0)
      @rtype1 = ResourceType.create(id: 1, category:"vehicle", company:"Brew Bears")
      @rtype2 = ResourceType.create(id: 2, category:"equipment", company:"Brew Bears")
      @resource1 = Resource.create(id: 1, resource_type_id:1, name:"van", cost:"75000", user_id:1)
      @resource1 = Resource.create(id: 2, resource_type_id:1, name:"car", cost:"25000", user_id:1)
      @resource2 = Resource.create(id: 3, resource_type_id:2, name:"bottler", cost:"5000", user_id:1)
      @p2 = Part.create(id: 2, name: 'worm', inventory: 1)
      @p3 = Part.create(id: 3, name: 'top', inventory: 2)
      @ticket1 = Ticket.create(table_key: 1, table_name: "Resources",user_id:1, notes:"needs oil change", priority:1, active: true, id:1)
      @ticket2 = Ticket.create(table_key: 2, table_name: "Resources",user_id:1, notes:"needs new transmission", priority:3, active: true, id:2)
      @ticket3 = Ticket.create(table_key: 1, table_name: "Parts",user_id:1, notes:"needs new top", priority:2, active: false, id:3)
    end
    describe '.all_active_ticket' do
      it 'returns active tickets' do
        expect(Ticket.all_active_tickets).to eq([@ticket1, @ticket2])
        expect(Ticket.all_active_tickets).to_not eq([@ticket3])
      end
    end

    describe '.tickets_by_resource' do
      it 'returns tickets_by_resource id' do
        expect(Ticket.tickets_by_resource(1)[0]).to eq(@ticket1)
        expect(Ticket.tickets_by_resource(2)[0]).to eq(@ticket2)
      end
    end

      describe '.tickets_by_part' do
        it 'returns tickets_by_part id' do
          expect(Ticket.tickets_by_part(1)).to eq([@ticket3])
          expect(Ticket.tickets_by_part(2)).to_not eq([@ticket2])
        end
      end
  end
end
