class ResourceType < ApplicationRecord
  validates_presence_of :category

  has_many :resources

  def self.all_active_resource_types
    where(active:true)
  end

end
