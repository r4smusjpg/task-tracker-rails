class ProjectsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_project, only: %i[show edit update destroy]
  before_action -> { authorize @project }, only: %i[show edit update destroy]
  before_action -> { authorize Project }, only: %i[index new create]

  def index
    @projects = Project.all
  end

  def show
    @members = User.where(id: @project.user_ids)
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = create_project.project
    if create_project.success?
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if update_project.success?
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.' if destroy_project.success?
  end

  private

    def create_project
      @create_project ||= CreateProject.call(project_params: project_params, current_user: current_user)
    end

    def update_project
      @update_project ||= UpdateProject.call(project_params: project_params, current_user: current_user, project: @project)
    end

    def destroy_project
      @destroy_project ||= DestroyProject.call(project: @project)
    end
  
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, user_ids: [])
    end
end
