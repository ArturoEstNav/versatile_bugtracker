class PagesController < ApplicationController
  # Remove me at the end!
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end
end
