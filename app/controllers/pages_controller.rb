class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = Project.all
    @tickets = Ticket.all
  end
end
