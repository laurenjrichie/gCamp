class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  has_many :projects, through: :memberships
  has_many :memberships
end
