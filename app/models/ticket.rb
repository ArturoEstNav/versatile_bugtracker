class Ticket < ApplicationRecord
  belongs_to :project
  has_many :memos
  has_many :events, as: :eventable
  validates :description, :priority, :status, :project_id,
            :title, presence: true

  def start_timer
    self.start_time = Time.now.to_i
    self.active = true
    self.save
  end

  def end_timer
    self.end_time = Time.now.to_i
    update_completion_hours(calculate_hour_difference)
    self.active = false
    self.end_time = 0
    self.start_time = 0
    self.save
  end

  def ticket_age_in_hours
    (Time.now - self.created_at).round / 60 / 60
  end

  def ticket_age_in_days
    (Time.now - self.created_at).round / 60 / 60 /24
  end

  private

  def update_completion_hours(time_object)
    self.completion_time += time_object
  end

  def calculate_hour_difference
    difference = self.end_time - self.start_time
    result = (difference / 60.0) / 60.0
    (result * 100).round / 100.0
  end
end
