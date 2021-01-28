class EventsController < ApplicationController
  def create
    @event = Event.new(attributes)
    @event.save
  end
end


