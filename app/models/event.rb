class Event < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :description, :ticket_id, :user_id, presence: true
end
