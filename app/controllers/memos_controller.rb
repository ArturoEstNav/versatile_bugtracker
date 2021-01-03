class MemosController < ApplicationController

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.ticket_id = params[:ticket_id]
    if @memo.save
      redirect_to ticket_path(params[:ticket_id])
    else
      render :new
    end
  end

  def edit
    @memo = Memo.find(params[:id])
  end

# only owner can update it
  def update
    @memo = Memo.find(params[:id])
    @memo.update(memo_params)

  end

  private

  def memo_params
    params.require(:memo).permit(:content)
  end
end



