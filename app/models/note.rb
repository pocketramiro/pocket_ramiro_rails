class Note < ApplicationRecord
  validates_presence_of :table_key
  validates_presence_of :table_name

  belongs_to :user

  def self.notes_by_resource(id)
    Note.where(table_key: id, table_name: "Resources")
  end
end
