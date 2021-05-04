class WorkingTicket < ApplicationRecord
  include TrackableWorkTime

  belongs_to :user
  belongs_to :ticket
end
