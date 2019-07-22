class ResourceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :resource_type_id, :name, :cost, :user_id, :active, :created_at, :updated_at

  belongs_to :user
end
