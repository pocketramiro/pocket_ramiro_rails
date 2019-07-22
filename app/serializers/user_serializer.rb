class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :phone_number, :email, :role, :active, :created_at, :updated_at
end
