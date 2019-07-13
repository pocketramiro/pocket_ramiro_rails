class ResourceType < ApplicationRecord
  validates_presence_of :category

  has_many :resources
  
end
