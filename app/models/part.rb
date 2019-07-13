class Part < ApplicationRecord
  validates_presence_of :name
  
  has_many :resource_parts
  has_many :resources, through: :resource_parts

end
