class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(create_params)
    @project.active = true
    if @project.save
      redirect_to
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
