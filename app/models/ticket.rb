class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_many :memos, :events
end
