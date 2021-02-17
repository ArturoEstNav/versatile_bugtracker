class MemosController < ApplicationController

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @memo = Memo.new
    authorize @memo
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.ticket_id = params[:ticket_id]
    authorize @memo
    if @memo.save
      event = Event.new(
              description: "added a memo on ticket #{params[:ticket_id]}",
              user: current_user,
              eventable: @memo,
              link: "/tickets/#{params[:ticket_id]}"
              )
      event.save
      redirect_to ticket_path(params[:ticket_id])
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:ticket_id])
    @memo = Memo.find(params[:id])
    authorize @memo
  end

# only owner can update it
  def update
    @memo = Memo.find(params[:id])
    authorize @memo
    if @memo.update(memo_params)
      redirect_to ticket_path(params[:ticket_id])
      event = Event.new(
              description: " modified a memo on #{params[:ticket_id]}",
              user: current_user,
              eventable: @memo,
              link: "/tickets/#{params[:ticket_id]}"
              )
      event.save
    else
      render :edit
    end

  end

  private

  def memo_params
    params.require(:memo).permit(:content)
  end
end
