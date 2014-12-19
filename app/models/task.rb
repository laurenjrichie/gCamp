class Task < ActiveRecord::Base
  validates :description, presence: true
  validate :due_date_cannot_be_in_the_past, :on => :create

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
        errors.add(:due_date, "can't be in the past")
    end
  end

  belongs_to :project

end
