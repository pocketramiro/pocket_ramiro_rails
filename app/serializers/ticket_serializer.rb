class TicketSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :table_key, :table_name, :user_id, :notes, :priority, :frequency_unit, :frequency_value, :created_at, :updated_at, :status

  belongs_to :user
end
