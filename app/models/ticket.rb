class Ticket < ApplicationRecord
  belongs_to :project
  has_many :memos
  has_many :events, as: :eventable
  validates :description, :priority, :status, :project_id,
            :title, presence: true
  attr_accessor :start_time, :end_time

  def start_timer
    @start_time = Time.now.to_i
  end

  def end_timer
    set_end_time
    update_completion_hours(calculate_hour_difference)
    self.save
  end

  private

  def set_end_time
    @end_time = Time.now.to_i
  end

  def update_completion_hours(time_object)
    self.completion_time += time_object
  end

  def calculate_hour_difference
    difference = @end_time - @start_time
    result = (difference / 60.0) / 60.0
    (result * 100).round / 100.0
  end
end
