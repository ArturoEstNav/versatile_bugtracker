class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_many :memos
  # add new column
  validates :description, :creator_id, :priority, :status, :owner_id,
            :project_id, :title, presence: true
  validates :email, :employee_id, uniqueness: true, presence: true
end
