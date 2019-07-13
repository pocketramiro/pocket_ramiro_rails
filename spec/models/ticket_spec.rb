require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'validations' do
    it { should validate_presence_of :foreign_key }
    it { should validate_presence_of :table_name }

  end

  describe 'relationships' do
    it { should belongs_to :user }
  end

  describe 'instance methods' do
  end
end
