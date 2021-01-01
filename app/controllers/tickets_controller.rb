class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @projects= Project.all.map {|project| [project.name, project.id] }
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id

    # TICKETS NOT BEING CREATED

    if @ticket.save
      # if user_signed_in? do
      #   description = "#{current_user.username} created ticket #{ticket.id}"
      #   event = Event.new("ticket", description)
      #   event.save
      # end
      redirect_to root_path
    else
      @errors = "#{doctor.errors.messages}"
      render :new
      p doctor.errors.messages
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
    @memos = Memo.where(ticket_id: params[:id]).order(created_at: :desc)
  end



  private

  def ticket_params
    params.require(:ticket).permit(:description, :project_id, :status,
      :priority, :category, :title )
  end
end
# end
