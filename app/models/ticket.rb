class Ticket < ApplicationRecord
  belongs_to :project
  has_many :memos

  validates :description, :priority, :status, :project_id,
            :title, presence: true
end
