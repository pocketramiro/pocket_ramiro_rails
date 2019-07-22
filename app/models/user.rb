class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :name
  validates_presence_of :role

  has_many :resources

  enum role: { admin: 0,facilities_manager: 1,brewer: 3,packaging: 4,visitor: 5 }

  has_secure_password
end
