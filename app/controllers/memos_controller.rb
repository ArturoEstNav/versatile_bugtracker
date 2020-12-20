class MemosController < ApplicationController
  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.user_id = current_user.id
    @memo.ticket_id = params[:ticket_id]
    if @memo.save
      # create event
      redirect_to memos_show_path(params[:id])
    else
      render :new
    end
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    @memo.update(memo_params)
    # create event
  end

  private

  def memo_params
    params.require(:memo).permit(:content)
  end
end




