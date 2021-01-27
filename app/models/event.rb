class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true

  def initalize(attributes = {})
    super
    @description = attributes[:description]
    @eventable_id = attributes[:eventable_id]
  end
end
