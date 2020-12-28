class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
    @projects= Project.all.map {|project| [project.name, project.id] }
    # [0, 'female'], ['1', 'male']
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator_id = current_user.id
    @ticket.owner_id = current_user.id

    # TICKETS NOT BEING CREATED

    if @ticket.save
      # if user_signed_in? do
      #   description = "#{current_user.username} created ticket #{ticket.id}"
      #   event = Event.new("ticket", description)
      #   event.save
      # end
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
      # if user_signed_in? do
      #   description = "#{current_user.username} modified ticket #{ticket.id}"
      #   event = Event.new("ticket", description)
      #   event.save
      # end
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
    params.require(:ticket).permit(:description, :project_id, :status,
      :priority, :category, :title )
  end
end
# end
