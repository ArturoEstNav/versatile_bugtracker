class TicketsController < ApplicationController

  def index
    @tickets = policy_scope(Ticket).order(created_at: :desc)
  end

  def new
    @ticket = Ticket.new
    @projects = Project.all.map {|project| [project.name, project.id]}
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    authorize @ticket

    if @ticket.save
      event = Event.new(
        description: "Opened ticket #{@ticket.title}",
        user: current_user,
        eventable: @ticket,
        link: "/tickets/#{params[:ticket_id]}"
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
    @users = User.all.map do |user|
      ["#{user.first_name} #{user.last_name}", user.id]
    end
    authorize @ticket
  end

  def close_ticket
    @ticket = Ticket.find(params[:id])
    authorize @ticket

    @ticket.end_timer if @ticket.active
    @ticket.update(status: 'closed')
    @ticket.save
    event = Event.new(
      description: "#{current_user.first_name} closed ticket #{@ticket.title}",
      user: current_user,
      eventable: @ticket,
      link: "/tickets/#{@ticket.id}"
    )
    event.save
    redirect_to ticket_path(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    authorize @ticket

    if @ticket.update(ticket_params)
      changes = Event.store_changes_record(@ticket.identify_ticket_changes)

      unless changes == "no changes"
        event = Event.new(
          description: "Changed the #{changes} on ticket #{@ticket.title}",
          user: current_user,
          eventable: @ticket,
          link: "/tickets/#{@ticket.id}"
        )
        event.save
      end
      redirect_to ticket_path(params[:id])
    else
      render :edit
    end
  end

  def update_hours
    @ticket = Ticket.find(params[:id])
    authorize @ticket

    if @ticket.active
      @ticket.end_timer
      redirect_to ticket_path(params[:id])
      current_user.working_ticket.destroy
    else
      @ticket.start_timer
      redirect_to ticket_path(params[:id])
      WorkingTicket.create(
        user: current_user,
        ticket: @ticket
      )
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    ticket_user = User.where(id: @ticket.user_id).map
    @ticket_user = ticket_user.first
    @memo = Memo.new
    @memos = Memo.where(ticket_id: params[:id]).order(created_at: :desc)
    authorize @ticket
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :project_id, :status,
    :priority, :category, :title, :user_id )
  end
end
