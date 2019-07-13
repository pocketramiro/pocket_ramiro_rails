require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'validations' do
    it { should validate_presence_of :table_key }
    it { should validate_presence_of :table_name }

  end

  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'instance methods' do
  end
end
