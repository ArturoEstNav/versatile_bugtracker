class Memo < ApplicationRecord
  belongs_to :ticket
  has_one :event, as: :eventable

  validates :content, :ticket_id, presence: true
end

