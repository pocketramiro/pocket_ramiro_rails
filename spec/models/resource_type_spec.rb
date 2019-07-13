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
end
