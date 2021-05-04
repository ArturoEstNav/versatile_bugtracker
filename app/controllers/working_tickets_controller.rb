class WorkingTicketsController < ApplicationController
  def show
  end

  def index
    @tickets = WorkingTicket.all
  end
end
