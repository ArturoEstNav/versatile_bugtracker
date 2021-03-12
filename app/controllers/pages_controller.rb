class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @projects = Project.all
    @tickets = Ticket.all
    @user_tickets = Ticket.where(user_id: current_user)
  end
end
