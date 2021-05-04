class Project < ApplicationRecord
  include ActiveModel::Dirty

  has_many :tickets
  has_many :events, as: :eventable

  validates :name, :description, presence: true

  def identify_project_changes
    record = self.saved_changes
    changes = []
    changes << 'name' if record.has_key?('name')
    changes << 'status' if record.has_key?('active')
    changes << 'description' if record.has_key?('description')
    changes
  end
end
