class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_many :memos, :events
  validates :description, :creator_id, :owner_id, :project_id, presence: true
  validates :email, :employee_id, uniqueness: true, presence: true
end
