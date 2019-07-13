require 'rails_helper'

RSpec.describe ResourcePart, type: :model do
  describe 'validations' do

  end

  describe 'relationships' do
    it { should belong_to :resource }
    it { should belong_to :part }
  end

  describe 'instance methods' do
  end
end
