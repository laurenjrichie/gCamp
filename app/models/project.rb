class Project < ActiveRecord::Base
  validates :name, presence: true
  has_many :tasks
  has_many :users, through: :memberships
  has_many :memberships
end
