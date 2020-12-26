class Event < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :description, :ticket_id, :user_id, presence: true
  def initialize(object)
    @user_id = current_user.id
    @object_id = params[:ticket_id]
    # adds memos, users, tickets and projects
  end
end
