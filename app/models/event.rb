class Event < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :description, :ticket_id, :user_id, presence: true
  def initialize(object, message)
    object_name = "@#{object}_id"
    parameter =  "#{object}_id".to_sym
    @owner_id = current_user.id
    self.instance_variable_set(object_name, params[parameter])
    @description = message
  end
end
