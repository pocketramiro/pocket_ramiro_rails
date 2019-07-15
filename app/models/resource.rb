class Resource < ApplicationRecord
  validates_presence_of :name

  has_many :resource_parts
  has_many :parts, through: :resource_parts

  def self.all_active_resources
    where(active:true)
  end
end
