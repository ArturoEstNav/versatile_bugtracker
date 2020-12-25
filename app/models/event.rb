class Event < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :description, :ticket_id, :user_id, presence: true
  def initialize(object)
    @user_id = current_user.id
    @(object)_id = params[:ticket_id]
    # adds memos, users, tickets and projects
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
end
