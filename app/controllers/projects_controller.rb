class ProjectsController < ApplicationController
  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(create_params)
    @project.active = true
    if @project.save
      event = Event.new(
              description: "#{current_user.first_name} added project #{@project.name}",
              user: current_user,
              eventable: @project,
              link: "/projects/#{@project.id}"
              )
      event.save
      redirect_to root_path
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
      event = Event.new(
              description: "#{current_user.first_name} has edited the project #{@project.name} status" ,
              user: current_user,
              eventable: @project,
              link: "/projects/#{@project.id}"
              )
      event.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  def index
    @projects = Project.all
    authorize @projects
  end

  private

  def create_params
    params.require(:project).permit(:name, :description)
  end

  def update_params
    params.require(:project).permit(:active)
  end
end
