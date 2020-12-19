class MemosController < ApplicationController
  def new
  end



  def edit
  end

  def show
  end

  private

  def memo_params
    # nested routes required
    params.require(:memo).permit( :ticket_id, :user_id, :content)
  end
end




