class Ticket < ApplicationRecord
  validates_presence_of :table_name
  validates_presence_of :table_key

  belongs_to :user

  enum priority: { high:3 , medium: 2, low: 1 }

  def self.all_active_tickets
    where(active:true)
  end

  def self.tickets_by_resource(resource_id)
    joins(:resources)
    where(table_key: resource_id)
  end

  def self.tickets_by_part(part_id)
    joins(:parts)
    where(part_id: part_id)
  end

end
