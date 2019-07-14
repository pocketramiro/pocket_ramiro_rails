class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password_digest
  validates_presence_of :name

  has_many :resources

  enum role: { admin: 0,facilities_manager: 1,brewer: 3,packaging: 4,visitor: 5 }
end
