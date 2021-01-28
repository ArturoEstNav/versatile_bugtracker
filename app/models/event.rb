class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true


  def initalize(attributes = {})
    super

    @description = attributes[:description]
    @eventable_id = attributes[:eventable_id]
    @eventable_link = attributes[:eventable_link]
  end
end
