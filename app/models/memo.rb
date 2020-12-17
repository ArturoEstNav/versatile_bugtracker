class Memo < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :content, :ticket_id, :user_id, presence: true
end
