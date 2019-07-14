class Ticket < ApplicationRecord
  validates_presence_of :table_name
  validates_presence_of :table_key

  belongs_to :user

  enum priority: { high:3 , medium: 2, low: 1 }

  def self.all_active_tickets
    where(active:true)
  end

end
