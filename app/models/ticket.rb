class Ticket < ApplicationRecord
  belongs_to :project
  has_many :memos
  has_many :events, as: :eventable
  validates :description, :priority, :status, :project_id,
            :title, presence: true
  attr_accessor :start_time, :end_time

  def start_timer
    @start_time = Time.now
  end

  def end_timer
    @end_time = Time.now
  end
end
