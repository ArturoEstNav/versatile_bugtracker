class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: [ :demo ]
  def home
    @projects = Project.all
    @tickets = Ticket.where(status: 'open')
    @user_tickets = Ticket.where(user_id: current_user, status: 'open')
  end

  def demo
  end
end
