class Memo < ApplicationRecord
  belongs_to :ticket

  validates :content, :ticket_id, presence: true
end

