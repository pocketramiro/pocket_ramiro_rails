class Ticket < ApplicationRecord
  validates_presence_of :table_name
  validates_presence_of :table_key

  belongs_to :user

end
