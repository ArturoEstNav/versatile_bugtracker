class WorkingTicketsController < ApplicationController
  def show
    @ticket = Ticket.find(current_user.working_ticket.ticket)
  end

  def index
    @tickets = WorkingTicket.all
  end
end
