class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = Event.where(user: @user).order('created_at DESC')
    @tickets = Ticket.where(user_id: @user, status: 'open')

    authorize @user
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
        event = UserEvent.new(
                  description: "Created user #{user.first_name} #{user.last_name}",
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

