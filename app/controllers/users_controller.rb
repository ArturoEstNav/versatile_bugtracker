class UsersController < ApplicationController

  def show
    user_events = Event.where(user: current_user)
    events = Event.where(user: current_user) + user_events
    @events = events
    authorize current_user
  end

  def new
    user = User.new
  end

  def create
    user = User.new(user_params, active: true)

    if user.save
      if user_signed_in?
        description = "#{current_user.username} created user #{user.username}"
        event = Event.new("user", description)
        event.save
      end
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        description = "#{current_user.username} modified user #{user.username}"
        event = Event.new("user", description)
        event.save
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end


  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
      :supervisor, :email, :employee_number)
  end
end

