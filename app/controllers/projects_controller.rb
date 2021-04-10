class ProjectsController < ApplicationController
  def new
    @project = Project.new

    authorize @project
  end

  def create
    @project = Project.new(create_params)
    @project.active = true

    authorize @project

    if @project.save
      event = Event.new(
              description: "Added project #{@project.name}",
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

    authorize @project
  end

  def update
    @project = Project.find(params[:id])

    authorize @project

    if @project.update(update_params)
      event = Event.new(
              description: "Edited the project #{@project.name}",
              user: current_user,
              eventable: @project,
              link: "/projects/#{@project.id}"
              )
      event.save
      redirect_to projects_path
    else
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
    @tickets = Ticket.where(project_id: @project)

    authorize @project
  end

  def index
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  private

  def create_params
    params.require(:project).permit(:name, :description)
  end

  def update_params
    params.require(:project).permit(:active, :name, :description)
  end
end
