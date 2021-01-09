class User < ActiveRecord::Base
  has_secure_password
  has_many :bags
 

  validates :name, presence: true, uniqueness: true

end
