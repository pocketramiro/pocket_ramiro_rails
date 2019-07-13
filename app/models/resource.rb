class Resource < ApplicationRecord
  validates_presence_of :name
  
  has_many :resource_parts
  has_many :parts, through: :resource_parts

end
