class Note < ApplicationRecord
  validates_presence_of :table_key
  validates_presence_of :table_name

  belongs_to :user
  
end
