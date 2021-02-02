class UsersController < ApplicationController
  def new
    user = User.new
  end

  def create
    # user_params[:first_name] = user_params[:first_name].downcase.gsub(/[\s\W]/, "_")
    # user_params[:last_name] = user_params[:last_name].downcase.gsub(/[\s\W]/, "_")
    user = User.new(user_params, active: true)

    if user.save
      if user_signed_in? do
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
    # if user_signed_in? do
    #   description = "#{current_user.username} modified user #{user.id}"
    #   event = Event.new("user", description)
    #   event.save
    # end
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  def show
    @test = "hi"
    # @user = current_user
    user_events = UserEvent.where(user_id: current_user)
    events = Event.where(user_id: current_user) + user_events
    # inject each one of them
    # @events = events.order(created_at: :desc)
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
end

