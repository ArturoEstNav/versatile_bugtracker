class Ticket < ApplicationRecord
  include ActiveModel::Dirty
  include TrackableWorkTime

  belongs_to :project
  has_many :memos
  has_many :events, as: :eventable

  validates :description, :priority, :status, :project_id,
            :title, presence: true

  def ticket_age_in_hours
    (Time.now - self.created_at).round / 60 / 60
  end

  def ticket_age_in_days
    (Time.now - self.created_at).round / 60 / 60 /24
  end

  def ticket_closing_date
    self.updated_at.strftime("Closed on %m/%d/%Y")
  end

  def identify_ticket_changes
    record = self.saved_changes
    changes = []
    changes << 'user' if record.has_key?('user_id')
    changes << 'status' if record.has_key?('status')
    changes << 'priority' if record.has_key?('priority')
    changes << 'category' if record.has_key?('category')
    changes
  end
end
