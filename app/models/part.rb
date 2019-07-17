class Part < ApplicationRecord
  validates_presence_of :name

  has_many :resource_parts
  has_many :resources, through: :resource_parts

  def self.parts_by_resource(resource_id)
    Part.select('parts.*')
      .joins(:resource_parts)
      .where("resource_parts.resource_id = #{resource_id}")
  end

end
