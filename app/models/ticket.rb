class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_many :memos
  # add new column
  validates :description, :priority, :status, :owner_id,
            :project_id, :creator_id, :owner_id, :title, presence: true
end
