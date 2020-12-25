class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator_id = current_user
    @ticket.owner_id = current_user

    if @ticket.save
      # create event
      # event = Event.new()
      # event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      # create event
      redirect_to ticket_path(params[:id])
    else
      render :edit
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :project_id, :email, :employee_id)
  end
end
