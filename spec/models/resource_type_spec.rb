require 'rails_helper'

RSpec.describe ResourceType, type: :model do
  describe 'validations' do
    it { should validate_presence_of :category }

  end

  describe 'relationships' do
    it { should have_many :resources }
  end

  describe 'instance methods' do
  end


    describe 'class methods' do
      before :each do
        Resource.destroy_all
        User.destroy_all
        ResourceType.destroy_all
        @user  = User.create(id: 1, name: "Cameron Marks", email: "cameron_marks@greatdivide.com", password_digest: "password", role: 0, phone_number: "7208674848", active: true, created_at: "2015-11-29 00:00:00", updated_at: "2019-06-01 00:00:00")
        @r_type1 = ResourceType.create(category: "Bright Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 1)
        @r_type2 = ResourceType.create(category: "Dull Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: true,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 2)
        @r_type3 = ResourceType.create(category: "Rough Tank", company: "Mueller", contact_number: 5419307880, contact_name: "Sheryl Michiel", active: false,manual_url: "https://en.wikipedia.org/wiki/Donald_Cameron_(mayor", created_at: "1994-06-22 00:00:00", updated_at: "2000-01-01 00:00:00",id: 3)
      end
      describe '.all_active_resource_types' do
        it 'returns active resource_types' do
          expect(ResourceType.all_active_resource_types).to eq([@r_type1, @r_type2])
          expect(ResourceType.all_active_resource_types).to_not eq([@r_type3])
        end
      end
    end
end
