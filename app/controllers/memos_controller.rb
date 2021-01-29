class MemosController < ApplicationController

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.ticket_id = params[:ticket_id]
    if @memo.save
      event = Event.new(
              description: "event test",
              user: current_user,
              eventable: @memo,
              link: "ticket_memos_path(@ticket.id)")
      event.save
      user_event = UserEvent.new(
              description: "user event test",
              user: current_user,
              link: "ticket_memos_path(@ticket.id)"
              )
      user_event.save

      redirect_to ticket_path(params[:ticket_id])
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:ticket_id])
    @memo = Memo.find(params[:id])
  end

# only owner can update it
  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      redirect_to ticket_path(params[:ticket_id])
    else
      render :edit
    end

  end

  private

  def memo_params
    params.require(:memo).permit(:content)
  end
end



