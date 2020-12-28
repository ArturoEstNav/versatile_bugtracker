class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(create_params)
    @project.active = true
    if @project.save
      redirect_to root_path
      # if user_signed_in? do
      #   description = "#{current_user.username} created project #{project.id}"
      #   event = Event.new("project", description)
      #   event.save
      # end
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @projects = Project.find(params[:id])
    if @project.update(update_params)
      # if user_signed_in? do
      #   description = "#{current_user.username} modified project #{project.id}"
      #   event = Event.new("project", description)
      #   event.save
      # end
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  private

  def create_params
    params.require(:project).permit(:name)
  end

  def update_params
    params.require(:project).permit(:active)
  end
end
