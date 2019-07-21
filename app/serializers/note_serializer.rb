class NoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :table_name, :table_key, :content, :user_id, :active, :created_at, :updated_at

  belongs_to :user
end
