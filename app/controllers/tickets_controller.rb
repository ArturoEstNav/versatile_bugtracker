class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
    authorize @tickets
  end

  def new
    @ticket = Ticket.new
    @projects= Project.all.map {|project| [project.name, project.id] }
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    authorize @ticket
    if @ticket.save
      event = Event.new(
              description: " added ticket #{@ticket.title}",
              user: current_user,
              eventable: @ticket,
              link: "/tickets/#{@ticket.id}"
              )
      event.save
      redirect_to root_path
    else
      @errors = "#{@ticket.errors.messages}"
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def update
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    if @ticket.update(ticket_params)
      event = Event.new(
              description: " modified ticket #{@ticket.title}",
              user: current_user,
              eventable: @ticket,
              link: "/tickets/#{@ticket.id}")
      event.save
      redirect_to ticket_path(params[:id])
    else
      render :edit
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @memos = Memo.where(ticket_id: params[:id]).order(created_at: :desc)
    authorize @ticket
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :project_id, :status,
      :priority, :category, :title )
  end

end
