class Ticket < ApplicationRecord
  include ActiveModel::Dirty

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
    store_changes_record(changes)
  end

  private

  def store_changes_record(array)
    if array.size == 0
      'no changes'
    elsif array.size == 1
      array[0].to_s
    elsif array.size == 2
      array.join(' and ')
    else
      second_half = array.pop
      first_half = array.join(', ')
      "#{first_half} and #{second_half}"
    end
  end
  def update_completion_hours(time_object)
    self.completion_time += time_object
  end

  def calculate_hour_difference
    difference = self.end_time - self.start_time
    result = (difference / 60.0) / 60.0
    (result * 100).round / 100.0
  end
end


