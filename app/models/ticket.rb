class Ticket < ApplicationRecord
  belongs_to :project
  has_many :memos
  has_many :events, as: :eventable


  validates :description, :priority, :status, :project_id,
            :title, presence: true
end
