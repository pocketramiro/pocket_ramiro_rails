require 'rails_helper'

RSpec.describe ResourceParts, type: :model do
  describe 'validations' do

  end

  describe 'relationships' do
    it { should belongs_to :resources }
    it { should belongs_to :parts }
  end

  describe 'instance methods' do
  end
end
