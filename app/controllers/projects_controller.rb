class ProjectsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_project, only: %i[show edit update destroy]
  before_action -> { authorize @project }, only: %i[show edit update destroy]
  before_action -> { authorize Project }, only: %i[index new create]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
  end

  private
  
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :user_ids).merge(user_id: current_user.id)
    end
end
