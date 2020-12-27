class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator_id = current_user
    @ticket.owner_id = current_user

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
    params.require(:ticket).permit(:description, :project_id, :email, :employee_id, )
  end
end
# end



 # t.text "description"
 #    t.string "status", default: "open"
 #    t.bigint "project_id", null: false
 #    t.datetime "created_at", precision: 6, null: false
 #    t.datetime "updated_at", precision: 6, null: false
 #    t.bigint "creator_id"
 #    t.bigint "owner_id"
 #    t.string "priority", default: "3"
 #    t.string "category"
 #    t.index ["creator_id"], name: "index_tickets_on_creator_id"
 #    t.index ["owner_id"], name: "index_tickets_on_owner_id"
 #    t.index ["project_id"], name: "index_tickets_on_project_id"
