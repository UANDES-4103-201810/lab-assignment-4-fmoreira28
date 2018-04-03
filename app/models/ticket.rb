class Ticket < ApplicationRecord
  belongs_to :event
  has_many :user_tickets
  has_many :users, through: :user_tickets
  validates :price, greater_than:0,:integer=>true
  validates :event_date_cannot_be_in_the_past

  def event_date_cannot_be_in_the_past
    if date.present? && event_date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
