class Project < ApplicationRecord
  has_many :tickets
  has_many :events, as: :eventable

  validates :name, :description, presence: true
end
