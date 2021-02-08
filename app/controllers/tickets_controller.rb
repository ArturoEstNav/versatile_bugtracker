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
  end

  def update
    @ticket = Ticket.find(params[:id])
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
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :project_id, :status,
      :priority, :category, :title )
  end

end
