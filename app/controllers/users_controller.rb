class UsersController < ApplicationController

  def show
    user_events = Event.where(user: current_user)
    # user events go here
    # events = Event.where(user: current_user) + user_events
    @events = user_events #events
    authorize current_user
  end

  def new
    user = User.new
    authorize current_user
  end

  def create
    user = User.new(user_params, active: true)
    authorize current_user
    if user.save
      if user_signed_in?
        # make it trigger on command
        event = UserEvent.new(
              description: "#{current_user.username} created user #{user.first_name} #{user.last_name}",
              user: current_user,
              link: "/user/#{user.id}"
              )
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
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  def index
    @users = policy_scope(User).order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
      :supervisor, :email, :employee_number)
  end
end

