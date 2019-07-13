require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }

  end

  describe 'relationships' do
    it { should have_many :resource_parts }
    it { should have_many(:parts).through(:resource_parts) }
  end

  describe 'instance methods' do
  end
end
