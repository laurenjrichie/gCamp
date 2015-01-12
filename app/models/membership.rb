class Membership < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :user_id, presence: true
  validates :project_id, presence: true
  validates :user_id, :uniqueness => {:scope => [:project_id]}
end
